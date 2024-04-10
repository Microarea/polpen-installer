#-------------------------------------------------------------------------------------------------
function ExistFile([string] $fileFullPath)
{
	If ($fileFullPath -eq '') {	
		write-host non esiste
		return $false;
	}
	
	return Test-Path -Path $fileFullPath -PathType Leaf -ErrorAction SilentlyContinue
}

#-------------------------------------------------------------------------------------------------
function ExistBucket([string] $search)
{
	$buckets = scoop bucket list 
	foreach($bucket in $buckets)
	{	
		if ($bucket.Name -eq $search)
		{
			return $true
		}
	}		
	return $false
}

#-------------------------------------------------------------------------------------------------
function InstallScoopIfNeeded()
{
	$scoopMainFile = Get-Command -ErrorAction SilentlyContinue scoop
	
	# $scoopMainFile is null or empty if previuos command produce error
	If (![string]::IsNullOrWhitespace($scoopMainFile)) {		
		Write-Host scoop already installed -ForegroundColor Green
		return 
		
	}
	Write-Host installing scoop
	iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
}

#-------------------------------------------------------------------------------------------------
function CheckAndInstallWithScoop([string] $processName)
{
	Write-Host checking $processName installation...
	
	$processFile = scoop which $processName
	$alreadyExistFile = ExistFile $processFile 
	If ($alreadyExistFile -eq $true) {	
		Write-Host $processName already installed -ForegroundColor Green
		return $processFile
	}
	
	Write-Host  $processName not found, installing...
	$installResult = scoop install -g $processName
	$processFile = scoop which $processName
	
	$alreadyExistFile = ExistFile $processFile 
	If ($alreadyExistFile -eq $false) {	
		Write-Host $processName installation failed -ForegroundColor Red
		return $processFile
	}

	return $processFile
}

Write-host Installing prerequisites...
Write-host please wait...

InstallScoopIfNeeded

CheckAndInstallWithScoop "git"
CheckAndInstallWithScoop "zstd"
CheckAndInstallWithScoop "winget"

$existBucket = ExistBucket "extras" 
if ($existBucket -eq $false)
{
	scoop bucket add extras
}

Write-host "installing Microsoft.DotNet.HostingBundle.6..."
winget install --id Microsoft.DotNet.HostingBundle.6  -e -h --accept-source-agreements --accept-package-agreements >$null

Write-host "installing Microsoft.VCRedist.2015+..."
winget install --id=Microsoft.VCRedist.2015+.x64  -e --accept-source-agreements --accept-package-agreements >$null


Write-Host prerequisites successfully installed
