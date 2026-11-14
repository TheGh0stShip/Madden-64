[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Target,
    [Parameter(Mandatory=$true)][string]$Candidates,
    [string]$Pattern='*.bin',
    [string]$Output='opencl-rank.json',
    [ValidateRange(1,1000000)][int]$Repeat=1,
    [ValidateSet('full','opcode','opcode-rs','opcode-rs-rt','control','registers')]
    [string]$FeatureMode='full',
    [ValidateRange(-64,64)][int]$WordShift=0
)

$ErrorActionPreference='Stop'
$files=@(Get-ChildItem -LiteralPath $Candidates -File -Filter $Pattern | Sort-Object Name)
if($files.Count -eq 0){throw 'No candidate files found.'}
function Convert-FeatureBytes([byte[]]$Bytes,[string]$Mode,[int]$Shift) {
    $result=New-Object byte[] $Bytes.Length
    $words=[int]($Bytes.Length/4)
    for($dst=0;$dst -lt $words;$dst++) {
        $src=$dst+$Shift
        if($src -lt 0 -or $src -ge $words){continue}
        $i=$src*4
        [uint32]$word=([uint32]$Bytes[$i] -shl 24) -bor ([uint32]$Bytes[$i+1] -shl 16) -bor `
            ([uint32]$Bytes[$i+2] -shl 8) -bor [uint32]$Bytes[$i+3]
        [uint32]$opcode=$word -shr 26
        switch($Mode) {
            'opcode'       {$word=$word -band [uint32]0xFC000000L}
            'opcode-rs'    {$word=$word -band [uint32]0xFFE00000L}
            'opcode-rs-rt' {$word=$word -band [uint32]0xFFFF0000L}
            'control'      {if($opcode -eq 0){$word=$word -band [uint32]0xFC00003FL}else{$word=$word -band [uint32]0xFC000000L}}
            'registers'    {$word=$word -band [uint32]0xFFFFFFC0L}
        }
        $o=$dst*4
        $result[$o]=[byte](($word -shr 24) -band 0xFF)
        $result[$o+1]=[byte](($word -shr 16) -band 0xFF)
        $result[$o+2]=[byte](($word -shr 8) -band 0xFF)
        $result[$o+3]=[byte]($word -band 0xFF)
    }
    return $result
}

$targetBytes=Convert-FeatureBytes ([IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $Target))) $FeatureMode 0
if($targetBytes.Length -eq 0){throw 'Target is empty.'}
$flat=New-Object byte[] ($targetBytes.Length*$files.Count)
for($i=0;$i -lt $files.Count;$i++){
    $bytes=Convert-FeatureBytes ([IO.File]::ReadAllBytes($files[$i].FullName)) $FeatureMode $WordShift
    if($bytes.Length -ne $targetBytes.Length){throw "Candidate length mismatch: $($files[$i].Name)"}
    [Array]::Copy($bytes,0,$flat,$i*$targetBytes.Length,$bytes.Length)
}

if(-not ('LegacyOpenCl.Ranker' -as [type])){
Write-Verbose 'Compiling the OpenCL interop helper.'
Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
using System.Text;

namespace LegacyOpenCl {
  public static class Native {
    const string Lib="OpenCL.dll";
    public const long DEVICE_TYPE_GPU=4;
    public const int MEM_READ_ONLY=1<<2, MEM_WRITE_ONLY=1<<1, TRUE=1;
    public const uint DEVICE_NAME=0x102B, DEVICE_GLOBAL_MEM_SIZE=0x101F,
      DEVICE_MAX_COMPUTE_UNITS=0x1002, PROGRAM_BUILD_LOG=0x1183;
    [DllImport(Lib)] public static extern int clGetPlatformIDs(uint n, IntPtr[] p, out uint count);
    [DllImport(Lib)] public static extern int clGetDeviceIDs(IntPtr p, long type, uint n, IntPtr[] d, out uint count);
    [DllImport(Lib)] public static extern int clGetDeviceInfo(IntPtr d,uint key,IntPtr size,byte[] value,out IntPtr used);
    [DllImport(Lib)] public static extern IntPtr clCreateContext(IntPtr props,uint n,IntPtr[] d,IntPtr cb,IntPtr data,out int err);
    [DllImport(Lib)] public static extern IntPtr clCreateCommandQueue(IntPtr c,IntPtr d,long props,out int err);
    [DllImport(Lib)] public static extern IntPtr clCreateBuffer(IntPtr c,int flags,IntPtr size,IntPtr host,out int err);
    [DllImport(Lib)] public static extern IntPtr clCreateProgramWithSource(IntPtr c,uint n,string[] src,IntPtr len,out int err);
    [DllImport(Lib)] public static extern int clBuildProgram(IntPtr p,uint n,IntPtr[] d,string opts,IntPtr cb,IntPtr data);
    [DllImport(Lib)] public static extern int clGetProgramBuildInfo(IntPtr p,IntPtr d,uint key,IntPtr size,byte[] value,out IntPtr used);
    [DllImport(Lib)] public static extern IntPtr clCreateKernel(IntPtr p,string name,out int err);
    [DllImport(Lib)] public static extern int clSetKernelArg(IntPtr k,uint i,IntPtr size,ref IntPtr value);
    [DllImport(Lib)] public static extern int clSetKernelArg(IntPtr k,uint i,IntPtr size,ref uint value);
    [DllImport(Lib)] public static extern int clEnqueueWriteBuffer(IntPtr q,IntPtr b,int blocking,IntPtr off,IntPtr size,byte[] data,uint n,IntPtr wait,IntPtr evt);
    [DllImport(Lib)] public static extern int clEnqueueNDRangeKernel(IntPtr q,IntPtr k,uint dim,IntPtr off,IntPtr[] global,IntPtr local,uint n,IntPtr wait,IntPtr evt);
    [DllImport(Lib)] public static extern int clEnqueueReadBuffer(IntPtr q,IntPtr b,int blocking,IntPtr off,IntPtr size,uint[] data,uint n,IntPtr wait,IntPtr evt);
    [DllImport(Lib)] public static extern int clFinish(IntPtr q);
    [DllImport(Lib)] public static extern int clReleaseMemObject(IntPtr x);
    [DllImport(Lib)] public static extern int clReleaseKernel(IntPtr x);
    [DllImport(Lib)] public static extern int clReleaseProgram(IntPtr x);
    [DllImport(Lib)] public static extern int clReleaseCommandQueue(IntPtr x);
    [DllImport(Lib)] public static extern int clReleaseContext(IntPtr x);
  }

  public sealed class Result {
    public uint[] Scores;
    public string Device;
    public uint ComputeUnits;
    public ulong GlobalMemory;
    public long ElapsedMilliseconds;
  }

  public static class Ranker {
    static void Ok(int e,string op){if(e!=0)throw new InvalidOperationException(op+" failed: "+e);}
    static string TextInfo(IntPtr d,uint key){
      IntPtr used; Ok(Native.clGetDeviceInfo(d,key,IntPtr.Zero,null,out used),"clGetDeviceInfo(size)");
      var b=new byte[used.ToInt32()]; Ok(Native.clGetDeviceInfo(d,key,used,b,out used),"clGetDeviceInfo");
      return Encoding.ASCII.GetString(b).TrimEnd('\0');
    }
    static T ScalarInfo<T>(IntPtr d,uint key) where T:struct {
      int n=Marshal.SizeOf(typeof(T)); var b=new byte[n]; IntPtr used;
      Ok(Native.clGetDeviceInfo(d,key,(IntPtr)n,b,out used),"clGetDeviceInfo(scalar)");
      var h=GCHandle.Alloc(b,GCHandleType.Pinned); try{return (T)Marshal.PtrToStructure(h.AddrOfPinnedObject(),typeof(T));}finally{h.Free();}
    }
    public static Result Run(byte[] target,byte[] candidates,uint count,uint repeat){
      Console.WriteLine("OPENCL_STAGE=platform");
      uint pc; Ok(Native.clGetPlatformIDs(0,null,out pc),"clGetPlatformIDs");
      if(pc==0)throw new InvalidOperationException("No OpenCL platform.");
      var ps=new IntPtr[pc]; Ok(Native.clGetPlatformIDs(pc,ps,out pc),"clGetPlatformIDs(list)");
      IntPtr dev=IntPtr.Zero;
      foreach(var p in ps){uint dc; int e=Native.clGetDeviceIDs(p,Native.DEVICE_TYPE_GPU,0,null,out dc); if(e==0&&dc>0){var ds=new IntPtr[dc];Ok(Native.clGetDeviceIDs(p,Native.DEVICE_TYPE_GPU,dc,ds,out dc),"clGetDeviceIDs");dev=ds[0];break;}}
      if(dev==IntPtr.Zero)throw new InvalidOperationException("No OpenCL GPU device.");
      Console.WriteLine("OPENCL_STAGE=context");
      int err; var ctx=Native.clCreateContext(IntPtr.Zero,1,new[]{dev},IntPtr.Zero,IntPtr.Zero,out err);Ok(err,"clCreateContext");
      IntPtr queue=IntPtr.Zero,tbuf=IntPtr.Zero,cbuf=IntPtr.Zero,obuf=IntPtr.Zero,prog=IntPtr.Zero,kernel=IntPtr.Zero;
      try{
        queue=Native.clCreateCommandQueue(ctx,dev,0,out err);Ok(err,"clCreateCommandQueue");
        tbuf=Native.clCreateBuffer(ctx,Native.MEM_READ_ONLY,(IntPtr)target.Length,IntPtr.Zero,out err);Ok(err,"target buffer");
        cbuf=Native.clCreateBuffer(ctx,Native.MEM_READ_ONLY,(IntPtr)candidates.Length,IntPtr.Zero,out err);Ok(err,"candidate buffer");
        obuf=Native.clCreateBuffer(ctx,Native.MEM_WRITE_ONLY,(IntPtr)(count*4),IntPtr.Zero,out err);Ok(err,"score buffer");
        const string src=@"__kernel void rank(__global const uchar* t,__global const uchar* c,uint n,uint repeat,__global uint* outv){uint id=get_global_id(0);uint s=0;size_t base=(size_t)id*n;for(uint r=0;r<repeat;r++){uint x=0;for(uint i=0;i<n;i++)x+=(c[base+i]!=t[i]);s=x;}outv[id]=s;}";
        Console.WriteLine("OPENCL_STAGE=build");
        prog=Native.clCreateProgramWithSource(ctx,1,new[]{src},IntPtr.Zero,out err);Ok(err,"clCreateProgramWithSource");
        err=Native.clBuildProgram(prog,1,new[]{dev},null,IntPtr.Zero,IntPtr.Zero);
        if(err!=0){IntPtr used;Native.clGetProgramBuildInfo(prog,dev,Native.PROGRAM_BUILD_LOG,IntPtr.Zero,null,out used);var b=new byte[used.ToInt32()];Native.clGetProgramBuildInfo(prog,dev,Native.PROGRAM_BUILD_LOG,used,b,out used);throw new InvalidOperationException("clBuildProgram failed: "+err+" "+Encoding.ASCII.GetString(b));}
        kernel=Native.clCreateKernel(prog,"rank",out err);Ok(err,"clCreateKernel");
        Console.WriteLine("OPENCL_STAGE=enqueue");
        Ok(Native.clEnqueueWriteBuffer(queue,tbuf,Native.TRUE,IntPtr.Zero,(IntPtr)target.Length,target,0,IntPtr.Zero,IntPtr.Zero),"write target");
        Ok(Native.clEnqueueWriteBuffer(queue,cbuf,Native.TRUE,IntPtr.Zero,(IntPtr)candidates.Length,candidates,0,IntPtr.Zero,IntPtr.Zero),"write candidates");
        uint n=(uint)target.Length; Ok(Native.clSetKernelArg(kernel,0,(IntPtr)IntPtr.Size,ref tbuf),"arg0");Ok(Native.clSetKernelArg(kernel,1,(IntPtr)IntPtr.Size,ref cbuf),"arg1");Ok(Native.clSetKernelArg(kernel,2,(IntPtr)4,ref n),"arg2");Ok(Native.clSetKernelArg(kernel,3,(IntPtr)4,ref repeat),"arg3");Ok(Native.clSetKernelArg(kernel,4,(IntPtr)IntPtr.Size,ref obuf),"arg4");
        var sw=System.Diagnostics.Stopwatch.StartNew();Ok(Native.clEnqueueNDRangeKernel(queue,kernel,1,IntPtr.Zero,new[]{(IntPtr)count},IntPtr.Zero,0,IntPtr.Zero,IntPtr.Zero),"enqueue");Ok(Native.clFinish(queue),"finish");sw.Stop();
        Console.WriteLine("OPENCL_STAGE=read");
        var scores=new uint[count];Ok(Native.clEnqueueReadBuffer(queue,obuf,Native.TRUE,IntPtr.Zero,(IntPtr)(count*4),scores,0,IntPtr.Zero,IntPtr.Zero),"read scores");
        return new Result{Scores=scores,Device=TextInfo(dev,Native.DEVICE_NAME),ComputeUnits=ScalarInfo<uint>(dev,Native.DEVICE_MAX_COMPUTE_UNITS),GlobalMemory=ScalarInfo<ulong>(dev,Native.DEVICE_GLOBAL_MEM_SIZE),ElapsedMilliseconds=sw.ElapsedMilliseconds};
      } finally {if(kernel!=IntPtr.Zero)Native.clReleaseKernel(kernel);if(prog!=IntPtr.Zero)Native.clReleaseProgram(prog);if(obuf!=IntPtr.Zero)Native.clReleaseMemObject(obuf);if(cbuf!=IntPtr.Zero)Native.clReleaseMemObject(cbuf);if(tbuf!=IntPtr.Zero)Native.clReleaseMemObject(tbuf);if(queue!=IntPtr.Zero)Native.clReleaseCommandQueue(queue);Native.clReleaseContext(ctx);}
    }
  }
}
'@
Write-Verbose 'OpenCL interop helper compiled.'
}

Write-Verbose "Submitting $($files.Count) candidates to OpenCL."
$result=[LegacyOpenCl.Ranker]::Run($targetBytes,$flat,[uint32]$files.Count,[uint32]$Repeat)
$rows=for($i=0;$i -lt $files.Count;$i++){
    [pscustomobject]@{candidate=$files[$i].Name;score=[uint32]$result.Scores[$i]}
}
$document=[ordered]@{
    schema='madden64-opencl-rank-v1'
    device=$result.Device
    compute_units=$result.ComputeUnits
    global_memory_bytes=$result.GlobalMemory
    target_bytes=$targetBytes.Length
    candidates=$files.Count
    repeat=$Repeat
    feature_mode=$FeatureMode
    word_shift=$WordShift
    kernel_elapsed_ms=$result.ElapsedMilliseconds
    results=@($rows | Sort-Object score,candidate)
}
$json=$document | ConvertTo-Json -Depth 5
[IO.File]::WriteAllText([IO.Path]::GetFullPath($Output),$json,[Text.UTF8Encoding]::new($false))
$document | Select-Object schema,device,compute_units,global_memory_bytes,target_bytes,candidates,repeat,kernel_elapsed_ms | ConvertTo-Json
