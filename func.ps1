#----------------------------------------------------------------------
#
# This file serves as a file that contains functions that other scripts
# may 'import' and use
#
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#
# Show all files in a folder with a specific extension
#
#----------------------------------------------------------------------
function showFiles
{
    # check for arguments passed in and declare default values
    param
    (
        [switch]$recurse            # show all files in all subdirectories if true
      , [switch]$sortLastWriteTime  # sort all files by last write time if true
      , $dirPath = ".\"
      , $ext = ""
    )

    # check input parameters to determine behavior
    if($recurse)                {write-host "Recursive search"          }
    if(-not $recurse)           {write-host "Non-recursive search"      }
    if($sortLastWriteTime)      {write-host "Sort by last write time"   }
    if(-not $sortLastWriteTime) {write-host "No sort"                   }
    write-host "Showing $($ext) files"

    get-childitem -path $dirPath -filter "*_prd"
}
