function Assert-Locations {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $dir,
		[Parameter(Mandatory=$true)][string] $location
	)

	Begin { [HashTable] $locations = Get-PackagedLocations }

	Process {
		$dir.index -= 1
		$dir.key = $dir.keys[$dir.index]
		$dir.exists = $locations[$dir.key] -eq $location
	}

	End { return (-not $dir.exists) -and ($dir.index -gt 0) }
}

function Assert-ExistingAliases {
	Param([Parameter(Mandatory=$true)][HashTable] $dir)

	Begin { $locations = Get-PackagedLocations }

	Process {
		[bool] $conflict = $dir.alias -eq $null
		if ($conflict) { return $false }

		[string] $alias = $dir.alias.ToString()
		$conflict = $locations.Contains($alias)

		return $conflict -and ($dir.index -ne -1)
	}
}

function Assert-BrokenLocation([string] $location) {
	return -not (Test-Path $location -PathType Container)
}
