function Step-Alias {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length,
	)

	Process {
		return $searcher.location.Substring($searcher.index + 1, $length)
	}
}

function Find-SlashDelimiter {
	Param([Parameter(Mandatory=$true)][HashTable] $searcher)

	Process { return $searcher.location.LastIndexOf('/', $searcher.index) }
}
