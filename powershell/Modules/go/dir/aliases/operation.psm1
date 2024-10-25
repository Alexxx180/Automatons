function Invoke-LocationOperation {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $operations,
		[Parameter(Mandatory=$true)][string] $location
	)

	Begin {
		$dirs = Get-PackagedLocations
		$assert = Get-AssertLocationTypes
		[HashTable] $dir = @{ exists = $false; index = $dirs.Length }
	}

	Process {
		$location = Clear-LocationPath $location

		Clear-RecentLocations

		while (Assert-Locations $dir $location $assert.directory) {
			Add-RecentLocation $dirs[$dir.index] $location
		}

		if ($dir.exists) {
			return $operations.directory.Invoke($dirs, $dir.index)
		}

		return $operations.recent.Invoke()
	}
}
