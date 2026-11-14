$ErrorActionPreference='Stop'
$root='C:\N64Decomp\workspaces\madden64-opencl-smoke'
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "$root\alienware_opencl_rank.ps1" `
    -Target "$root\target.bin" -Candidates "$root\candidates" -Pattern 'c00000.bin' `
    -Output "$root\rank-one.json" -Repeat 1 -Verbose
if($LASTEXITCODE -ne 0){throw "OpenCL smoke scorer exited $LASTEXITCODE"}
Get-Content -LiteralPath "$root\rank-one.json" -Raw
