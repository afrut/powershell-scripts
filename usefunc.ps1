#----------------------------------------------------------------------
#
# This file serves as a test file for using functions
# Shows how to:
#   - access arguments passed into a script
#   - use functions contained in other script files
#   - pass switches and arguments to a function
#
# To use: usefunc .png
#
#----------------------------------------------------------------------
# clear screen
Clear-Host

# access functions in this file
. "func.ps1"

showFiles -SortLastWriteTime -Extension ".txt" -Recurse