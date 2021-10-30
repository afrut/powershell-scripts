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
function ShowFiles
{
    # check for arguments passed in and declare default values
    param
    (
        [switch]$Recurse            # show all files in all subdirectories if true
      , [switch]$SortLastWriteTime  # sort all files by last write time if true
      , $Path = "."
      , $Extension = ""
    )

    # check input parameters to determine behavior
    if($Recurse)                {Write-Host "Recursive search"          }
    if(-not $Recurse)           {Write-Host "Non-recursive search"      }
    if($SortLastWriteTime)      {Write-Host "Sort by last write time"   }
    if(-not $SortLastWriteTime) {Write-Host "No sort"                   }
    Write-Host "Showing $($Extension) files"

    Get-Childitem -Path $Path -Filter "*$Extension"
}