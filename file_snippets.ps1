#----------------------------------------------------------------------
#
# This file serves as a reference for common commands used in powershell
#
#----------------------------------------------------------------------

# list all files in current directory
get-childitem .

# list all files in a directory
get-childitem D:\src

# list all files in directories recursively
get-childitem D:\src\learn\python -recurse

# filter for a specific type of file
get-childitem D:\src -recurse -filter *.py

# list all files and sort by last write time
get-childitem D:\src\learn\python -recurse | sort lastwritetime

# loop through each file returned
get-childitem D:\src\learn\python -recurse -filter *.py |
foreach-object {

    # write the name of the file
    write-host $_.name;

    # write the name of the file with full path
    write-host $_.fullname;

    # write the type of the file
    write-host $_.gettype();
}
