#----------------------------------------------------------------------
#
# This file serves as a reference for some commands in powershell
#
#----------------------------------------------------------------------
# print to console
Write-Host 'hello world'

# clear screen
Clear-Host





<#
#----------------------------------------------------------------------
#
# Getting child items in a directory
#
#----------------------------------------------------------------------
# recursively search for all files in the current directory with a
# file depth of not more than 2 and include hidden/system files
Get-ChildItem -Path '.\' -Recurse -Depth 2 -Force

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
$ret = Get-ChildItem -Path 'D:\src' -Recurse -Exclude $ext
Write-Host $ret.GetType()

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
