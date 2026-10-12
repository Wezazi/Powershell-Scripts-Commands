Get-Command | ForEach-Object {
    $help = Get-Help $_

    $obj = [ordered]@{
        Name     = $help.Name
        Synopsis =  if (-not $help.Remarks) {$help.Synopsis} else {$null}
    }
[pscustomobject]$obj
} | ft

