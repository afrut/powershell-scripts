# This file serves as a reference for some commands in powershell

# clear screen
Clear-Host

# print to console
Write-Host "Hello, World!"

$myvar = "foo"                          # a string variable
$myint = 100                            # an integer variable
$array1 = @(1,2,3,4)                    # an integer array with initialization
$array2 = New-Object string[] 3         # a string array without initialization
$map1 = @{foo = 0; bar = 1; baz = 2}    # a map with initilization
$map2 = @{}                             # a map without initialization
$list = New-Object Collections.Generic.List[Int]   # a list

# A typical for loop
for($cnt = 0; $cnt -lt $array2.length; $cnt++)
{
    $elem = $myvar + [string]$cnt       # create a string
    $map2.add($cnt, $elem)              # add an element to a map
    $array2[$cnt] = $elem               # change an element in an array
}

# A while loop
$cnt = 0
while($cnt -lt $myint)
{
    $elem = Get-Random -Maximum 999     # get a random integer with a maximum of 999
    if($elem % 2 -eq 0)                 # if the random integer is even add it to the lsit
    {
        $list.Add($elem)
    }
    $cnt++
}
Write-Host "Number of elements added: $($list.Count)"
Write-Host ""

# Recursively search for all files in the current directory with a
# file depth of not more than 2 and include hidden/system files.
$files = Get-ChildItem -Path "." -Recurse -Depth 2 -Force

# For every child of this directory
$files = New-Object Collections.Generic.List[Object]
$dirs = New-Object Collections.Generic.List[Object]
Get-ChildItem -Path "." -Force | ForEach-Object {
    # Check if the current object is a directory
     if(Test-Path -Path $_.FullName -PathType Container)
     {
         $dirs.Add($_)

         # If the current directory does not start its name with "."
        if($_.Name[0] -ne ".")
        {
            # Recursively search it and add its files to the list of files.
            Get-ChildItem -Path $_.FullName -Force | ForEach-Object {$files.Add($_)}
        }
     }
     # If it is not, add this file to the list.
     else {$files.Add($_)}
}

# Write to output file.
$files | ForEach-Object {$_.FullName} | Out-File -File outputs\all-files.txt

# Print full path of all ps1 files.
Write-Host "All ps1 files:"
$files | Where-Object {$_.Extension -eq ".ps1" } | ForEach-Object { Write-Host $_.FullName }
Write-Host ""

# Alternatively, search for all files that match certain regex patterns.
$exts = @("*.ps1", "*.cmd")
$srcfiles = Get-ChildItem -Path "." -Recurse -Include $exts
$srcfiles | ForEach-Object {$_.FullName} | Out-File -File outputs\source-files.txt

# Get all text files and sort by lastwritetime
$files = Get-ChildItem -Path ".\outputs" | Where-Object {$_.Extension -eq ".txt"} |
    Sort-Object LastWriteTime -Descending
$files | ForEach-Object {$_.FullName} | Out-File -File "./outputs/text-files-sorted.txt"
Write-Host "All text files sorted in descending order of modified time:"
$files | ForEach-Object {$_.FullName} | Write-Host

# Get content of a file.
$content = Get-Content "outputs/source-files.txt"