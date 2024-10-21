[System.Collections.Generic.List[System.String]] $script:dir = [System.Collections.Generic.List[System.String]]::new()
[HashTable] $script:aliases = @{}

function Rename-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if ($script:dir.Contains($location)) {
			return "Alias '$alias' created for '$location'"
		}

		[HashTable] $searcher = Get-AliasSearcher $location
		$alias = [System.Text.StringBuilder]::new($searcher.alias)

		while (($script:aliases.Contains($alias)) -and ($searcher.search -ne -1)) {
			Find-AliasWithinPath $searcher $location
			$alias.Insert(0, $searcher.alias)
		}

		$script:dir.Add($location)
		$script:aliases[$alias] = $location
		return "Alias '$alias' created for '$location'"
	}
}

# /, , ?, *, :, ", <, >, |

function Push-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if (-not (Test-Path $location)) {
			return "Doesn't exist: '$location'"
		}

		[string] $alias = Rename-PackagedLocation $location
		return "Alias '$alias' created for '$location'"
	}
}

function Move-ToPackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		$location = Clear-LocationPath $location

		foreach ($dir in $script:dir) {
			if ($dir.location -eq $location) {
				Set-Location $dir.location
				return
			}
			if ($dir.alias -eq $location) {
				Set-Location $dir.location
				return
			}
		}

	}
}
