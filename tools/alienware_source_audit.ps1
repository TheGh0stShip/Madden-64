[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$SourceRoot,
    [Parameter(Mandatory=$true)][string]$Output
)
$ErrorActionPreference='Stop'
$files=@(Get-ChildItem -LiteralPath $SourceRoot -Recurse -File | Where-Object {$_.Extension -in '.c','.h','.s','.S','.inc'})
$patterns=[ordered]@{
    inline_asm='(?im)\b(__asm__|asm)\s*\('
    register_binding='(?im)\bregister\b[^;\r\n]*\basm\s*\('
    incbin='(?im)\.incbin\b'
    raw_directive='(?im)^\s*\.(word|byte|half|long)\b'
    m2c_macro='(?im)\b(INCLUDE_ASM|GLOBAL_ASM|M2C_ERROR)\b'
}
$parts=0..3
$jobs=foreach($part in $parts){
    $subset=@($files | Where-Object {([Math]::Abs($_.FullName.GetHashCode()) % 4) -eq $part} | Select-Object -ExpandProperty FullName)
    Start-Job -ArgumentList $subset,$patterns -ScriptBlock {
        param($paths,$checks)
        foreach($path in $paths){
            $text=[IO.File]::ReadAllText($path)
            $hits=@()
            foreach($entry in $checks.GetEnumerator()){
                if([regex]::IsMatch($text,[string]$entry.Value)){$hits+=[string]$entry.Key}
            }
            [pscustomobject]@{path=$path;bytes=(Get-Item -LiteralPath $path).Length;sha256=(Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant();findings=$hits}
        }
    }
}
try{$rows=@($jobs | Wait-Job | Receive-Job)}finally{$jobs|Remove-Job -Force}
$document=[ordered]@{
    schema='madden64-source-audit-v1'
    worker=$env:COMPUTERNAME
    logical_processors=[Environment]::ProcessorCount
    file_count=$rows.Count
    total_bytes=($rows|Measure-Object bytes -Sum).Sum
    finding_files=@($rows|Where-Object {$_.findings.Count -gt 0}).Count
    files=@($rows|Sort-Object path)
}
[IO.File]::WriteAllText([IO.Path]::GetFullPath($Output),($document|ConvertTo-Json -Depth 6),[Text.UTF8Encoding]::new($false))
$document|Select-Object schema,worker,logical_processors,file_count,total_bytes,finding_files|ConvertTo-Json
