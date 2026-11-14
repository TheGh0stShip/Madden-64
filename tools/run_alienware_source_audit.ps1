$ErrorActionPreference='Stop'
$root='C:\N64Decomp\workspaces\madden64-source-audit'
$source=Join-Path $root 'source'
if(Test-Path -LiteralPath $source){Remove-Item -LiteralPath $source -Recurse -Force}
New-Item -ItemType Directory -Path $source | Out-Null
tar.exe -xzf (Join-Path $root 'source.tar.gz') -C $source
if($LASTEXITCODE -ne 0){throw "tar extraction failed: $LASTEXITCODE"}
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File (Join-Path $root 'alienware_source_audit.ps1') `
    -SourceRoot $source -Output (Join-Path $root 'source-audit.json')
if($LASTEXITCODE -ne 0){throw "source audit failed: $LASTEXITCODE"}
Get-FileHash -LiteralPath (Join-Path $root 'source-audit.json') -Algorithm SHA256 | Format-List
