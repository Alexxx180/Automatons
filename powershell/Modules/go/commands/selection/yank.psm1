function Get-YankRootLocation {
	Param([string] $selection)

	Begin { $locations = Get-PackagedLocations }

	Process {
		if ($selection -eq 'root') {
			[string] $location = (Get-Location).Drive.Root
		} else {
			[string] $location = $locations[$selection]
		}
		return $location
	}
}

function Get-YankLocationString([string] $selection) {
	Begin { $locations = Get-PackagedLocations }

	Process {
		if ($locations.Contains($selection)) {
			return Get-YankRootLocation $selection
		}
		[HashTable] $dir = Copy-AssociateYankLocation $selection
		if ($dir.exists) {
			return $locations[$dir.keys[$dir.index]]
		}
		return ''
	}
}

function Get-YankLocation([string] $selection) {
	Process {
		[string] $location = Get-YankLocationString $selection

		if ($location -eq '') {
			Write-Output "Something"
			return Get-NoLocations
		} else {
			Set-Clipboard $location
			return 'Copied to clipboard.'
		}
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
