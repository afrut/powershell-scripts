Clear-Host

# Get environment variables of the current process.
$envars = [Environment]::GetEnvironmentVariables().Keys

# Find all user-scoped environment variables.
$usrvars = New-Object Collections.Generic.List[String]
$machinevars = New-Object Collections.Generic.List[String]
$envars | ForEach-Object {
    $envar = [Environment]::GetEnvironmentVariable($_, "user")
    if($envar.Length -gt 0) { $usrvars.Add($_) }
    else { $machinevars.Add($_) }
}

# Write results ot output file.
$usrvars | Out-File -File "./outputs/env-user-vars.txt"
$machinevars | Out-File -File "./outputs/env-machine-vars.txt"

# Get path variables.
$usrpath = [Environment]::GetEnvironmentVariable("PATH", "user")
$machinepath = [Environment]::GetEnvironmentVariable("PATH")

# Write to output files.
$usrpathout = "outputs/env-path-usr.txt"
$usrpath.Split(";") | Where-Object {$_.Length -gt 0} | Select-Object -Unique |
    Out-File -File $usrpathout
$machinepathout = "outputs/env-path-machine.txt"
$machinepath.Split(";") | Where-Object {$_.Length -gt 0} | Select-Object -Unique |
Out-File -File $machinepathout

# Read in new user path variable.
$usrpathnew = (Get-Content $usrpathout) -Join ";"
$machinepathnew = (Get-Content $machinepathout) -Join ";"
# [Environment]::SetEnvironmentVariable("PATH", $machinepathnew, "machine")