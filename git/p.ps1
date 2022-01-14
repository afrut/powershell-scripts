clear
git remote -v | Set-variable -Name "gitremote"
$shortname = ($gitremote[0] | Select-String -Pattern '[\w-]*?\.git').Matches.Groups[0].Value
$repo = "$([System.Environment]::GetEnvironmentVariable('GITHUB-REPO','user'))$shortname"
git push $repo