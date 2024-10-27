function Find-AliasByIndex {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length
	)

	Begin { [string] $delimiter = '.' }

	Process {
		if ($searcher.index -ne -1) {
			[string] $prefix = Step-Alias $searcher $length
			$searcher.alias.Insert(0, $delimiter).Insert(0, $prefix) > $null
		}
	}
}

function Find-AliasWithinPath {
	Param([Parameter(Mandatory=$true)][HashTable] $searcher)

	Process {
		[int] $length = $searcher.index
		Search-PathDelimiter $searcher $length
		Find-AliasByIndex $searcher $length
	}
}
