# Reference for starting other programs and processes

# Start Visual Studio Code at a certain directory.
code "D:\src\powershell-scripts\"

# Open an Explorer window at a certain directory.
explorer "D:\src\"

# Start a powershell session.
$StartInfo = New-Object System.Diagnostics.ProcessStartInfo
$StartInfo.FileName = "$pshome\powershell.exe"
$StartInfo.Arguments = "-NoExit
 -Command `$Host.UI.RawUI.WindowTitle=`'Test Powershell Session`';
           Set-Location `'D:\src\`'
"
[System.Diagnostics.Process]::Start($StartInfo)

# Run a shortcut.
Invoke-Item '.\resources\sample-shortcut.lnk'

# Execute a powershell script from a shortcut.
# powershell.exe -ExecutionPolicy Bypass -File PathToScript