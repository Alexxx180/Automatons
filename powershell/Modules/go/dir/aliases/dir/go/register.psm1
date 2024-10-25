function Register-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Begin {
		$assert = Get-AssertLocationTypes
		[HashTable] $dir = @{ exists = $false; index = (Get-PackagedLocations).Length }
	}

	Process {
		if (-not (Test-Path $location -PathType Container)) { return }

		[HashTable] $searcher = Get-AliasSearcher $location

		Find-AliasWithinPath $searcher
		while ($searcher.index -eq -1) {
			Find-AliasWithinPath $searcher '.'
		}

		$script:dir.Add(@{
			alias = $searcher.alias.ToString()
			location = $location
		})
	}
}
