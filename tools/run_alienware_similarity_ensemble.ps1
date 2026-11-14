param(
    [string]$Root='C:\N64Decomp\workspaces\madden64-overlay-similarity-v2',
    [string[]]$Modules=@('overlay1','overlay4')
)
$ErrorActionPreference='Stop'
$ranker=Join-Path $Root 'alienware_opencl_rank_ensemble.ps1'
$modes=@('full','opcode','opcode-rs','opcode-rs-rt','control','registers')
$shifts=-16..16
$outRoot=Join-Path $Root 'ensemble-results'
New-Item -ItemType Directory -Force -Path $outRoot | Out-Null

foreach($module in $Modules) {
    $moduleRoot=Join-Path $Root $module
    $manifest=Get-Content -LiteralPath (Join-Path $moduleRoot 'batch\manifest.json') -Raw | ConvertFrom-Json
    $moduleOut=Join-Path $outRoot $module
    New-Item -ItemType Directory -Force -Path $moduleOut | Out-Null
    foreach($target in $manifest) {
        $checkpoint=Join-Path $moduleOut ($target.id + '.json')
        if(Test-Path -LiteralPath $checkpoint){continue}
        $targetDir=Join-Path (Join-Path $moduleRoot 'batch') $target.id
        $mapping=@{}
        foreach($row in (Get-Content -LiteralPath (Join-Path $targetDir 'candidates.json') -Raw | ConvertFrom-Json)){
            $mapping[$row.file]=$row
        }
        $votes=@{}
        $observations=@()
        foreach($mode in $modes) {
            foreach($shift in $shifts) {
                $temp=Join-Path $moduleOut '_current.json'
                & $ranker -Target (Join-Path $targetDir 'target.bin') `
                    -Candidates (Join-Path $targetDir 'candidates') -Output $temp `
                    -FeatureMode $mode -WordShift $shift | Out-Null
                $rank=Get-Content -LiteralPath $temp -Raw | ConvertFrom-Json
                $top=@($rank.results | Select-Object -First 5)
                for($place=0;$place -lt $top.Count;$place++) {
                    $candidate=$mapping[$top[$place].candidate].source
                    if(-not $votes.ContainsKey($candidate)){$votes[$candidate]=0}
                    $votes[$candidate] += 5-$place
                    if($place -eq 0) {
                        $observations += [pscustomobject]@{mode=$mode;shift=$shift;
                            score=$top[$place].score;candidate=$candidate}
                    }
                }
            }
        }
        $leaders=@($votes.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 20 | ForEach-Object {
            [pscustomobject]@{candidate=$_.Key;weighted_votes=$_.Value}
        })
        [pscustomobject]@{schema='madden64-opencl-ensemble-v1';target=$target.target;
            target_offset=$target.offset;size=$target.size;passes=$modes.Count*$shifts.Count;
            leaders=$leaders;winners=$observations} | ConvertTo-Json -Depth 7 |
            Set-Content -LiteralPath $checkpoint -Encoding UTF8
        Write-Output ("ENSEMBLE target={0} passes={1} leader={2}" -f $target.target,
            ($modes.Count*$shifts.Count),$leaders[0].candidate)
    }
}

$hashes=Get-ChildItem -LiteralPath $outRoot -Recurse -File | Get-FileHash -Algorithm SHA256 |
    Select-Object @{n='file';e={$_.Path.Substring($outRoot.Length+1)}},Hash
$hashes | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $outRoot 'SHA256SUMS.json') -Encoding UTF8
Compress-Archive -Path (Join-Path $outRoot '*') -DestinationPath (Join-Path $Root 'ensemble-results.zip') -Force
