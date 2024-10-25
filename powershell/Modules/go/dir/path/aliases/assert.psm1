function Assert-Locations {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $iterator,
		[Parameter(Mandatory=$true)][string] $location,
		[Parameter(Mandatory=$true)][ScriptBlock] $loctype
	)

	Process {
		$dirs = Get-PackagedLocations
		$iterator.exists = $loctype.Invoke($dirs[$i], $location)
		$iterator.index -= 1
		return (-not $iterator.exists) -and ($iterator.index -ge 0)
	}
}

function Get-AssertLocationTypes { return $script:assert }

$script:assert = @{
	directory = {
		Param([HashTable] $dir, [string] $location)
		return ($dir.alias -eq $location) -or
			($dir.location -eq $location)
	}
}
