function Step-FirstAlias {
	Param([int] $start, [int] $word, [string] $location)

	Process { return $location.Substring($start, $word) }
}

function Get-AliasIfAny {
	Param([int] $index, [int] $length, [string] $location)

	Process {
		[int] $start = $index + 1
		[int] $word = $length - $start
		[string] $alias = Step-FirstAlias $start $word $location
		return $alias
	}
}

function Step-Alias {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length
	)

	Process {
		return Get-AliasIfAny $searcher.index $length $searcher.location
	}
}

function Find-PathDelimiter {
	Param([string] $location, [int] $end)

	Process { return $location.LastIndexOf('/', $end - 1) }
}

function Search-PathDelimiter {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length
	)

	Process {
		$searcher.index = Find-PathDelimiter $searcher.location $length
	}
}
