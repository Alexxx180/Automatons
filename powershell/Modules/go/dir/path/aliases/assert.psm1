function Assert-Locations {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $dir,
		[Parameter(Mandatory=$true)][string] $location,
		[Parameter(Mandatory=$true)][ScriptBlock] $loctype
	)

	Process {
		$dirs = Get-PackagedLocations
		$dir.index -= 1
		$dir.exists = $loctype.Invoke($dirs[$dir.index], $location)
		return (-not $dir.exists) -and ($dir.index -gt 0)
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
