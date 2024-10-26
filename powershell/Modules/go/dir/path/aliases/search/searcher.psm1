function Get-AliasSearcher {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		[int] $length = $location.Length
		[int] $index = Find-PathDelimiter $location $length

		$alias = [System.Text.StringBuilder]::new()
		$first = Get-AliasIfAny $index $length $location

		return @{
			location = $location
			index = $index
			alias = $alias.Append($first)
		}
	}
}

function Search-ForAlias {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		[HashTable] $searcher = Get-AliasSearcher $location
		while (Assert-ExistingAliases $searcher) {
			Find-AliasWithinPath $searcher
		}
		return $searcher.alias
	}
}
