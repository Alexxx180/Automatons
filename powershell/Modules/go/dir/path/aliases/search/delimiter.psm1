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
		Write-Host "$start + $word = $alias"
		return $alias
	}
}

function Step-Alias {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $searcher,
		[Parameter(Mandatory=$true)][int] $length
	)

	Process {
		Write-Host ("LOC: " + $searcher.location)
		return Get-AliasIfAny $searcher.index $length $searcher.location
	}
}

function Find-PathDelimiter {
	Param(
		[Parameter(Mandatory=$true)][string] $location,
		[Parameter(Mandatory=$true)][int] $end
	)

	Process { return $location.LastIndexOf('/', $end - 1) }
}
