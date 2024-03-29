# This file serves as a reference for some commands in powershell

# clear screen
Clear-Host

# print to console
Write-Host "Hello, World!" -ForegroundColor Green

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
$map2.Clear()                           # delete all elements from the map

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
Write-Host ""

# Get all text files and sort by full path and file name.
$files = Get-ChildItem -Path ".\outputs" | Where-Object {$_.Extension -eq ".txt"} |
    Sort-Object FullName
$files | ForEach-Object {$_.FullName} | Out-File -File "./outputs/text-files-sorted.txt"
Write-Host "All text files sorted by path and name:"
$files | ForEach-Object {$_.FullName} | Write-Host

# Get content of a file.
$content = Get-Content "outputs/source-files.txt"

# Create a new directory
$newDir = New-Item -Path ".\outputs\" -ItemType "directory" -Name "NewDirectory" -Force

# Create a new file and disregard its output.
New-Item -Path "outputs\" -ItemType "file" -Name "NewFile" -Force | Out-Null
New-Item -Path "outputs\NewDirectory" -ItemType "file" -Name "NewFile" -Force | Out-Null
New-Item -Path "outputs\NewDirectory" -ItemType "directory" -Name "AnotherNewDirectory" -Force | Out-Null

# Access the first argument to this script
$firstArg = $args[0]

# Get the type of a variable.
$type = $newDir.GetType()

# Get the members of an object.
$newDir | Get-Member

# Get the handle to a file.
$newFile = Get-Item(".\outputs\NewFile")

# Append some content to a file.
"Some content" | Out-File $newFile -Append

# Delete an item.
Remove-Item -Path ".\outputs\NewFile"

# Delete a directory and all its contents.
Remove-Item -path ".\outputs\NewDirectory" -Recurse

# Execute a regex search, retrieve matching value or group values.
$url = "https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories"
$result = ($url | Select-String 'https://([\w\.]*?\.com)')
$matchvalue = $result.Matches.Groups[0].Value
$firstgroup = $result.Matches.Groups[1].Value

# ` escapes characters in strings.
write-host "`$notAVariable"

# Using a simple hashtable.
$ht = [Environment]::GetEnvironmentVariables()
$ht.Keys                                    # Keys of the hashtable.
$ht.Values                                  # Values of the hashtable.
$ht["PATH"]                                 # Access a value by its key.
$ht.GetEnumerator() | Sort-Object Name      # Sort the hash table by the Name field.
write-host ""

# Request user input. Stores as string initially.
#$numstr = read-host "Enter a number"

# Cast to int.
#$num = $numstr.ToInt32($null)
#$num = $num -as [int]
