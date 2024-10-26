function Search-ForAlias {
	Param([string] $location)

	Process {
		[HashTable] $searcher = Get-AliasSearcher $location
		Find-AliasWithinPath $searcher
		while ($searcher.index -ne -1) {
			Find-AliasWithinPath $searcher '.'
		}
		return $searcher.alias.ToString()
	}
}

function Register-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	#Begin {
		#$assert = Get-AssertLocationTypes
		#[HashTable] $dir = @{ exists = $false; index = (Get-PackagedLocations).Length }
	#}

	Process {
		if (-not (Test-Path $location -PathType Container)) {
			return Get-NoLocations
		}

		[HashTable] $next = @{
			alias = Search-ForAlias $location
			location = $location
		}

		$script:dir.Add($next)
		return "New location '$($next.alias)' - '$($next.location)'"
	}
}
