# Based on: https://powershell.one/tricks/filesystem/filesystemwatcher
Clear-Host
try
{
    $path = (Get-Item ".\").FullName # Path to watch
    $fileFilter = "*" # Pattern for files to watch for
    $includeSubDirs = $true # Watch subdirectories as well
    $properties = @([IO.NotifyFilters]::FileName
        ,[IO.NotifyFilters]::LastWrite `
    )
    $timeout = 1000 # Timeout after 1 s without any changes
    $changeTypes = @(
        [System.IO.WatcherChangeTypes]::All
        ,[System.IO.WatcherChangeTypes]::Created
        ,[System.IO.WatcherChangeTypes]::Deleted
        ,[System.IO.WatcherChangeTypes]::Changed
        ,[System.IO.WatcherChangeTypes]::Renamed
    )

    $watcher = New-Object -TypeName IO.FileSystemWatcher -ArgumentList $path, $fileFilter `
        -Property @{IncludeSubdirectories = $includeSubDirs;
            NotifyFilter = $properties}

    # Define code to execute when a change is detected
    $action = {
        # change type information:
        $details = $event.SourceEventArgs
        $Name = $details.Name
        $FullPath = $details.FullPath
        $OldFullPath = $details.OldFullPath
        $OldName = $details.OldName
        
        # type of change:
        $ChangeType = $details.ChangeType
        
        # when the change occured:
        $Timestamp = $event.TimeGenerated

        $message = "{0} was {1} at {2}" -f $FullPath, $ChangeType, $Timestamp
        Write-Host "----------------------------------------------------------------------"
        Write-Host $message
    }


    # Register event handlers
    $handlers = . {
        Register-ObjectEvent -InputObject $watcher -EventName Changed  -Action $action 
        Register-ObjectEvent -InputObject $watcher -EventName Created  -Action $action 
        Register-ObjectEvent -InputObject $watcher -EventName Deleted  -Action $action 
        Register-ObjectEvent -InputObject $watcher -EventName Renamed  -Action $action 
    }

    # Start monitoring
    Write-Host "Now monitoring $path"
    $watcher.EnableRaisingEvents = $true

    # Keep powershell busy while monitoring so it does not accept other input
    do
    {
        Wait-Event -Timeout 1
        Write-Host "." -NoNewLine
    } while ($true)
}
finally
{
    # stop monitoring
    $watcher.EnableRaisingEvents = $false

    # remove the event handlers
    $handlers | ForEach-Object {
    Unregister-Event -SourceIdentifier $_.Name
    }

    # event handlers are technically implemented as a special kind
    # of background job, so remove the jobs now:
    $handlers | Remove-Job

    # properly dispose the FileSystemWatcher:
    $watcher.Dispose()
}
