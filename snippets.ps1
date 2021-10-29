# This file serves as a reference for some commands in powershell

# clear screen
Clear-Host

# print to console
Write-Host "Hello, World!"

$myvar = "foo"                          # a string variable
$myint = 100                             # an integer variable
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
    $elem = Get-Random -Maximum 999 # get a random integer with a maximum of 999
    if($elem % 2 -eq 0)             # if the random integer is even add it to the lsit
    {
        $list.Add($elem)
    }
    $cnt++
}
Write-Host "Number of elements added: $($list.Count)"

# recursively search for all files in the current directory with a
# file depth of not more than 2 and include hidden/system files
#Get-ChildItem -Path '.\' -Recurse -Depth 2 -Force
<# TODO:
select-object
foreach-object
#>




<#
#----------------------------------------------------------------------
#
# Getting child items in a directory
#
#----------------------------------------------------------------------

# recursively search in a specified directory for files that match
# a single string pattern and return only their names
Get-ChildItem -Path '.\' -Recurse -Filter '*.py' -Name

# recursively search in a specified directory for files
# that include the specified strings patterns
$ext = @('*.cpp','*.py','hello','snippets')
Get-ChildItem -Path 'D:\src\' -Recurse -Include $ext

# recursively search in a specified directory for files
# that that do not include certain string patterns
$ext = @('*.py')
Get-ChildItem -Path 'D:\src\python\' -Recurse -Exclude $ext
#>





#----------------------------------------------------------------------
#
# Using the sort object
#
#---------------------------------------------------------------------
# $ret = Get-ChildItem -Path 'D:\src' -Recurse -Exclude $ext
# Write-Host $ret.GetType()

# something different









## list all files and sort by last write time
#Get-ChildItem D:\src\learn\python -recurse | sort lastwritetime
#
## loop through each file returned
#Get-ChildItem D:\src\learn\python -recurse -filter *.py |
#foreach-object {
#
#    # write the name of the file
#    write-host $_.name;
#
#    # write the name of the file with full path
#    write-host $_.fullname;
#
#    # write the type of the file
#    write-host $_.gettype();
#}
