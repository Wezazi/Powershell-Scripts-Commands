Get-Command | ForEach-Object { 
    $name = $_.Name;
    if (((Get-Help $name).remarks -match 'partial help')){
        write-output ""
    }
    else{
        Get-Help $name | ForEach-Object{
            $synopsis = $_.synopsis
            Write-Output $name $synopsis `n
        }
    }
};

