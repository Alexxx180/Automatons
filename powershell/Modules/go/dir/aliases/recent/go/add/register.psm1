function Register-RecentLocation {
	Param(
		[Parameter(Mandatory=$true)][string] $key,
		[Parameter(Mandatory=$true)][string] $alias
	)

	Begin {
		$locations = Get-PackagedLocations
		$recent = Get-RecentLocations
	}

	Process {
		if ($locations[$key] -like "*$alias*") {
			$recent.$key = $locations[$key]
		}
	}
}
