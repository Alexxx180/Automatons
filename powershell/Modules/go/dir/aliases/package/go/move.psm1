$script:operations = @{
	directory = {
		Param($dirs, [int] $no)
		Move-ToLocationFromList $dirs $no
	}
	recent = @{
		save = $true,
		feedback = {
			Param([string] $location)
			if ((Get-NoLocations) -eq (Move-ToRecentLocations)) {
				Register-PackagedLocation $location
			}
		}
	}
}

function Move-ToPackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process { Invoke-LocationOperation $script:operations $location }
}
