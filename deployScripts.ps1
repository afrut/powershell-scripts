$scripts = @(
    "D:\src\powershell-scripts\watchFiles.ps1"
    ,"D:\src\powershell-scripts\deployScripts.ps1"
    ,"D:\src\powershell-scripts\git\b.ps1"
    ,"D:\src\powershell-scripts\git\c.ps1"
    ,"D:\src\powershell-scripts\git\f.ps1"
    ,"D:\src\powershell-scripts\git\l.ps1"
    ,"D:\src\powershell-scripts\git\p.ps1"
    ,"D:\src\powershell-scripts\git\s.ps1"
)

$scripts | Foreach-Object {
    if(Test-Path -Path $_ -PathType Leaf)
    {
        Write-Host "Copying $($_) to D:\scripts\"
        Copy-Item $_ "D:\scripts"
    }
}