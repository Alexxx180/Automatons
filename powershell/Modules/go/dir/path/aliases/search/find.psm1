function Find-AliasByIndex {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length
	)

	Begin { [string] $delimiter = '.' }

	Process {
		if ($searcher.index -ne -1) {
			[string] $prefix = Step-Alias $searcher $length
			$searcher.alias.Insert(0, $delimiter).Insert(0, $prefix)
		}
	}
}

function Find-AliasWithinPath {
	Param([Parameter(Mandatory=$true)][HashTable] $searcher)

	Process {
		$length = $searcher.index
		$searcher.index = Find-PathDelimiter $searcher.location $length
		return Find-AliasByIndex $searcher $length
	}
}
