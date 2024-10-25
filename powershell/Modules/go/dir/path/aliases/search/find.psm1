function Find-AliasByIndex {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length,
		[string] $delimiter
	)

	Process {
		if ($searcher.index -ne -1) {
			[string] $prefix = Step-Alias $searcher $length
			$searcher.alias.Insert(0, $delimiter).Insert(0, $prefix)
		}
	}
}

function Find-AliasWithinPath {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[string] $delimiter = ''
	)

	Process {
		$length = $searcher.index
		$searcher.index = Find-SlashDelimiter $searcher
		return Find-AliasByIndex $searcher $length $delimiter
	}
}
