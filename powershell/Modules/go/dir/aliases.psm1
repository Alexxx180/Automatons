function Get-AliasSearcher {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		return @{
			[int] length = $location.Length
			[int] search = $location.LastIndexOf($delim, $length)
			[string] alias = $location.Substring($search + 1, $length)
		}
	}
}

function Find-AliasWithinPath {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][string] $location
	)

	Process {
		$searcher.length = $location.Length
		$searcher.search = $location.LastIndexOf($delim, $searcher.length - 1)
		$searcher.alias = $location.Substring($search + 1, $searcher.length)
	}
}
