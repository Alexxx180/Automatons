function Assert-Locations {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $dir,
		[Parameter(Mandatory=$true)][string] $location,
		[Parameter(Mandatory=$true)][ScriptBlock] $loctype
	)

	Process {
		$dirs = Get-PackagedLocations
		$dir.exists = $loctype.Invoke($dirs[$i], $location)
		$dir.index -= 1
		return (-not $dir.exists) -and ($dir.index -ge 0)
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
