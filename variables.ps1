# Reference script for powershell commands relating to variables in a session

# Show all variables.
Get-Variable

# Show all matching variables.
Get-Variable 'ps*'

# Some notable variables.
$pshome # Home directory of powershell.
$host # Object that is hosting the current shell session.
$home # Path to home directory of current user.
$profile # The profile used in the current session.