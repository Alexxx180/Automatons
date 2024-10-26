function Move-ToPackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process { Invoke-LocationOperation $script:operations $location }
}

$script:operations = @{
	directory = { Param($dirs, $row) Move-ToLocationRow $dirs $row }
	recent = @{
		save = $true
		edit = { Param($location) Edit-RecentLocations $location }
	}
}
