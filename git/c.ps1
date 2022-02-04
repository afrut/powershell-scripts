Clear-Host
$branches = git branch
if($args.Count -eq 0)
{
  for($i = 0; $i -lt $branches.Count; $i++)
  {
      if($branches[$i][0] -eq "*")
        {write-host "    $i".PadRight(10, " ") $($branches[$i]) -ForegroundColor Green}
      else
        {write-host "    $i".PadRight(10, " ") $($branches[$i])}
  }

  $bnum = $(Read-Host "Enter branch number") -as [int]
  if($bnum -lt 0 -or $bnum -ge $branches.Count)
    {write-host "Invalid branch number."}
  else
    {git checkout "$($branches[$bnum].Trim())"}
}
else
{
  git checkout $args[0]
}
git branch