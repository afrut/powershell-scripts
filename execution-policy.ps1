# Execution policy is a safety feature to prevent malicious scripts from running.

# Get execution policies for all scopes.
Get-ExecutionPolicy -List

# Get policy for a single scope (current process).
Get-ExecutionPolicy -Scope Process

# Get policy for the current user.
Get-ExecutionPolicy -Scope CurrentUser

# Set execution policy for the current user and store in registry.
# RemoteSigned enables running of local scripts and downloaded scripts that are
# signed by a trusted publiser.
# Restricted prevents running of scripts.
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned