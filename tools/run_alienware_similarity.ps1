param([string]$Root='C:\N64Decomp\workspaces\madden64-function-similarity-v1')
$ErrorActionPreference='Stop'
$root=$Root
$batch=Join-Path $root 'batch'
$results=Join-Path $root 'results'
New-Item -ItemType Directory -Force -Path $results | Out-Null
$manifest=Get-Content -LiteralPath (Join-Path $batch 'manifest.json') -Raw | ConvertFrom-Json
$summary=@()
foreach($target in $manifest){
    $dir=Join-Path $batch $target.id
    $output=Join-Path $results ($target.id + '.json')
    & (Join-Path $root 'alienware_opencl_rank.ps1') -Target (Join-Path $dir 'target.bin') `
        -Candidates (Join-Path $dir 'candidates') -Pattern '*.bin' -Output $output -Repeat 1 | Out-Null
    $rank=Get-Content -LiteralPath $output -Raw | ConvertFrom-Json
    $mapping=@{}
    foreach($row in (Get-Content -LiteralPath (Join-Path $dir 'candidates.json') -Raw | ConvertFrom-Json)){
        $mapping[$row.file]=$row
    }
    $top=@($rank.results | Select-Object -First 10 | ForEach-Object {
        [pscustomobject]@{score=$_.score; candidate=$mapping[$_.candidate].source;
                         candidate_offset=$mapping[$_.candidate].offset}
    })
    $summary += [pscustomobject]@{target=$target.target; target_offset=$target.offset;
                                 size=$target.size; compared=$target.candidates; top=$top}
    Write-Output ("RANKED {0} candidates={1} best={2}" -f $target.target,$target.candidates,$top[0].score)
}
$summary | ConvertTo-Json -Depth 7 | Set-Content -LiteralPath (Join-Path $results 'rankings.json') -Encoding UTF8
$hashes=Get-ChildItem -LiteralPath $results -File | Get-FileHash -Algorithm SHA256 | `
    Select-Object @{n='file';e={$_.Path.Substring($results.Length+1)}},Hash
$hashes | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $results 'SHA256SUMS.json') -Encoding UTF8
Compress-Archive -LiteralPath (Join-Path $results '*') -DestinationPath (Join-Path $root 'results.zip') -Force
Write-Output ("COMPLETE targets={0}" -f $summary.Count)
