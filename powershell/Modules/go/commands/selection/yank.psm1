function Get-YankRootLocation {
	Param([string] $selection)

	Process {
		if ($selection -eq 'root') {
			[string] $location = (Get-Location).Drive.Root
		} else {
			[string] $location = $locations[$selection]
		}
		return $location
	}
}

function Get-YankLocation([string] $selection) {
	Begin { $locations = Get-PackagedLocations }

	Process {
		if ($locations.Contains($selection)) {
			[string] $location = Get-YankRootLocation $selection
			Set-Clipboard $location
			return 'Copied to clipboard.'
		}

		[HashTable] $dir = Copy-AssociateYankLocation $selection
		if ($dir.exists) {
			Set-Clipboard $locations[$dir.keys[$dir.index]]
			return 'Copied to clipboard.'
		}

		Write-Output "Something"

		return Get-NoLocations
	}
}

function Copy-AssociateYankLocation {
	Param([Parameter(Mandatory=$true)][string] $selection)

	Begin {
		[HashTable] $dir = Get-PackageSearcher (Get-PackagedLocations)
	}

	Process {
		$location = Clear-LocationPath $selection
		while (Assert-Locations $dir $location -NoStrict) {}
		return $dir
	}
}
