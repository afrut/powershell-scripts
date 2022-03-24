Clear-Host

# Get the current date and time
$now = Get-Date     # a System.DateTime

# Create a Date Time
$dt = Get-Date -Year 2021 -Month 6 -Day 20 -Hour 14 -Minute 43 -Second 17

# Difference between two dates.
$ts = $now - $dt    # a System.TimeSpan

# The same timespan in different units
#$ts.TotalDays       # Number of days with decimals
#$ts.TotalHours
#$ts.TotalMinutes
#$ts.TotalSeconds
#$ts.TotalMilliseconds

# Create a time span
$ts2 = New-TimeSpan -Seconds 60
