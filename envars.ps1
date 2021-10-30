Clear-Host

# Get environment variables of the current process.
$envars = [Environment]::GetEnvironmentVariables().Keys

# Find all user-scoped environment variables.
$usrvars = New-Object Collections.Generic.List[String]
$machinevars = New-Object Collections.Generic.List[String]
$envars | ForEach-Object {
    $envar = [Environment]::GetEnvironmentVariable($_, [System.EnvironmentVariableTarget]::User)
    if($envar.Length -gt 0) { $usrvars.Add($_) }
    else { $machinevars.Add($_) }
}

# Write results ot output file.
$usrvars | Out-File -File "./outputs/env-user-vars.txt"
$machinevars | Out-File -File "./outputs/env-machine-vars.txt"

# Get path variables.
$usrpath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
$machinepath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::Machine)

# Write to output files.
$usrpathout = "outputs/env-path-usr.txt"
$usrpath.Split(";") | Where-Object {$_.Length -gt 0} | Select-Object -Unique |
    Out-File -File $usrpathout
$machinepathout = "outputs/env-path-machine.txt"
$machinepath.Split(";") | Where-Object {$_.Length -gt 0} | Select-Object -Unique |
    Out-File -File $machinepathout

# Read in new user path variable.
$usrpathnew = (Get-Content "outputs/env-path-usr-new.txt") -Join ";"
$machinepathnew = (Get-Content "outputs/env-path-machine-new.txt") -Join ";"
[Environment]::SetEnvironmentVariable("PATH", $usrpathnew, [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("PATH", $machinepathnew, [System.EnvironmentVariableTarget]::Machine)