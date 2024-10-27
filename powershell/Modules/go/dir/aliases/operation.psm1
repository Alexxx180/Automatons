function Save-RecentLocation {
	Param([HashTable] $operations, [string] $key, [string] $location)

	Process {
		if ($operations.recent.save) {
			Register-RecentLocation $key $location
		}
	}
}

function Invoke-LocationOperation {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $operations,
		[Parameter(Mandatory=$true)][string] $location
	)

	Begin {
		[HashTable] $locations = Get-PackagedLocations
		[HashTable] $dir = Get-PackageSearcher $locations
	}

	Process {
		if ($operations.recent.save) { Clear-RecentLocations }

		if ($locations.Contains($location)) {
			Save-RecentLocation $operations $location $location
			return Move-ToLocationRow $locations $location
		}

		$location = Clear-LocationPath $location

		while (Assert-Locations $dir $location) {
			Save-RecentLocation $operations $dir.key $location
		}
		Save-RecentLocation $operations $dir.key $location

		if ($dir.exists) {
			return $operations.directory.Invoke($locations, $dir.key)
		}

		return $operations.recent.edit.Invoke($location)
	}
}
