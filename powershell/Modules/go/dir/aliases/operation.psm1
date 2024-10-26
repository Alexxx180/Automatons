function Invoke-LocationOperation {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $operations,
		[Parameter(Mandatory=$true)][string] $location
	)

	Begin {
		[HashTable] $locations = Get-PackagedLocations
		[HashTable] $dir = Get-PackageSearcher
	}

	Process {
		$location = Clear-LocationPath $location

		if ($operations.recent.save) { Clear-RecentLocations }

		while (Assert-Locations $dir $location) {
			if ($operations.recent.save) {
				Register-RecentLocation $dir.key $location
			}
		}

		if ($dir.exists) {
			return $operations.directory.Invoke($locations, $dir.key)
		}

		# TODO: Delete after completing main use cases
		$empty = Get-NoLocations
		if ($empty -eq (Move-ToRecentLocations)) {
			return Add-NewRecentLocation $location
		}
		return $empty

		return $operations.recent.feedback.Invoke($location)
	}
}
