# Based on: https://powershell.one/tricks/filesystem/filesystemwatcher
# Call with default parameters: .\watchFiles.ps1
# Specify a diretory to watch: .\watchFiles.ps1 -WatchPath "..\path\to\dir\"
# Specify a command to pass the file to: .\watchFiles.ps1 -WatchPath "..\path\to\dir\" -Command programToRun

# Sample call
# .\watchFiles.ps1 -WatchPath "testdir"-Command python -Arguments foo -FileFilters "^(.+).py$","^(.+).txt$"
param(
    $WatchPath=".\"         # Path of directory to watch
    ,$Command="powershell"  # Command/program to pass the file to
    ,$Arguments=""          # Arguments to pass to the program
    ,[string[]]$FileFilters=@("*.*")
)

Clear-Host
try
{
    # Directory to watch
    $WatchPath = "$((Get-Item $WatchPath).FullName)\"
    $fileFilter = "*.*"     # Pattern for files to watch for
    $includeSubDirs = $true # Watch subdirectories as well

    # Properties of files to watch
    $properties = @([IO.NotifyFilters]::FileName
        ,[IO.NotifyFilters]::LastWrite `
    )
    $timeout = 200          # Poll for any event fired every 200 milliseconds

    # Create the FileSystemWatcher object
    $watcher = New-Object -TypeName IO.FileSystemWatcher -ArgumentList $WatchPath, $fileFilter `
        -Property @{IncludeSubdirectories = $includeSubDirs;
            NotifyFilter = $properties}

    # Create a timer 
    $timer = [System.Timers.Timer]::new()
    $timer.Interval = $timeout
    $timer.AutoReset = $False
    
    # Register event handlers
    Register-ObjectEvent -InputObject $watcher -EventName Changed -SourceIdentifier "File.Changed"
    Register-ObjectEvent -InputObject $watcher -EventName Created -SourceIdentifier "File.Created"
    Register-ObjectEvent -InputObject $watcher -EventName Deleted -SourceIdentifier "File.Deleted"
    Register-ObjectEvent -InputObject $watcher -EventName Renamed -SourceIdentifier "File.Renamed"
    Register-ObjectEvent -InputObject $timer -EventName Elapsed -SourceIdentifier "Timer.Elapsed"

    # Create a dictionary whose keys are filenames that have been created/deleted/modified
    $filenames = @{}
    
    # Start monitoring
    Write-Host "Now monitoring $WatchPath"
    $timer.Start()
    $watcher.EnableRaisingEvents = $true

    # Main loop
    do
    {
        $waitevent = Wait-Event
    
        # Reset the timer every time an event is received
        $timer.Stop()
        $timer.Start()

        # Get filenames and clear event queue.
        $events = Get-Event
        for($n = 0; $n -lt $events.Length; $n++)
        {
            $evt = $events[$n]

            # Remove event from queue
            Remove-Event -EventIdentifier $evt.EventIdentifier

            # Process the events based on identifier
            switch($evt.SourceIdentifier)
            {
                "File.Changed" {
                    $filenames[$evt.SourceEventArgs.Name] = ""
                }

                "timer.Elapsed" {
                    # If there are filenames stored
                    $N = $filenames.Count
                    if($N -gt 0)
                    {
                        foreach($key in $filenames.keys)
                        {
                            foreach($pattern in $FileFilters)
                            {
                                # Execute some code to do something with the filenames
                                $matched = $key -match $pattern
                                if($matched)
                                {
                                    # Execute some code to do something with the filenames
                                    #Write-Host "$((Get-Date).ToString("yyyy-MM-dd hh:mm:ss:fff")) $Command $WatchPath$key $Arguments"
                                    Invoke-Expression "$Command $WatchPath$key $Arguments"
                                    break
                                }
                            }
                        }
                    }

                    # Clear the hashtable for when the next set of events fire
                    $filenames.clear()

                    # Restart the timer.
                    $timer.Start()
                }
            }
        }
    } while ($true)
}
finally
{
    # stop monitoring
    $watcher.EnableRaisingEvents = $false

    # Stop the timer.
    $timer.Stop()

    # remove the event handlers
    Unregister-Event -SourceIdentifier "File.Changed"
    Unregister-Event -SourceIdentifier "File.Created"
    Unregister-Event -SourceIdentifier "File.Deleted"
    Unregister-Event -SourceIdentifier "File.Renamed"
    Unregister-Event -SourceIdentifier "Timer.Elapsed"

    # properly dispose the FileSystemWatcher:
    $watcher.Dispose()
}
