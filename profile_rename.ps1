# writen by ivan.temchenko@kyivstar.net 2015

$val = $false
$path = Read-Host ("Provide full path of the target folder")
$u = $false

while ($u -ne $true)
{
	$user = Read-Host ("Provide username: ")
	$full_path = $path + $user
	if ((Test-Path $full_path) -ne $true)
	{
		Write-Host("User not found. try again.")
	}
	else
	{
		$u = $true
		Write-Host("Profile $full_path found. Renaming.")
	}
}

$new_path = $path + "_" + $user
$new_user = "_" + $user

if ((Test-Path $new_path) -eq $true)
{
	Write-Host("Found old renamed profile at $new_path. Erasing...")
	Remove-Item $new_path -Force
}

while ($val -ne $true)
{
	try
	{
		Write-Host("Trying to rename $full_path to $new_user")
		Rename-Item $full_path $new_user -erroraction stop
		if ((Test-Path $new_path) -eq $true)
		{
			$val = $true
			Write-Host("Rename successfull.")
		}
	}
	catch [System.IO.IOException]
	{
		(Get-Date).DateTime + " Error Cought: " + $_.Exception.Message + " Sleeping 60 seconds then retrying."
		Start-Sleep 60
	}
}
