Get-Command | ForEach-Object {
    $help = Get-Help $_

    $obj = [ordered]@{
        Name     = $help.Name
        Synopsis =  if (-not $help.Remarks) {$help.Synopsis} else {$null}
    }
[pscustomobject]$obj
} | fl # same thing as format-list




# I noticed that everytime i wrote this: get-help <command> | select-object synopsis | format-list  it would return the syntax instead of the synopsis if the command's help page didn't include a synopsis
# I couldn't find a solution. I needed a way to differentiate commands that had a synopsis from commands that didn't have a synopsis. 
# A friendly guy in a powershell discord server recommended ((get-help <command>).remarks -match 'partial help') i compared the returned value from a command that had a synopsis with a command that didn't have a synopsis and it returned different boolean values. So this command became the solution to make commands without a synopsis return an empty string instead of the syntax
# get-command has a synopsis and if you run: ((get-help get-command).remarks -match 'partial help') you will notice that it returns false. Enable-NetAdapterUro doesn't have a synopsis and if your run: ((get-help Enable-NetAdapterUro).remarks -match 'partial help') you will notice that it returns True
# The friendly guy also helped me improve my initial help.ps1 script

