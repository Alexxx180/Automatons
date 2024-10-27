<#
.SYNOPSIS
	Go to the specified location
.DESCRIPTION
	Search for location in packages, add to the storage if found any.
	If not create new package and associate it with alias. If same
	alias exist - extend and separate it via '.'
.PARAMETER Location
	The alias to search in packages or path to the folder location.
.EXAMPLE
	C:\PS> Open-Location .
	Go to the same location - save package
.EXAMPLE
	C:\PS> Open-Location F:\test\Image
	Go to the location - save package with 'test.Image' alias if
	'Image' alias exists, save with 'Image' alias otherwise
.NOTES
	Author: Tatarintsev Aleksander
	Date:   October 27, 2024
#>
function Open-Location {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if ($args.Count -gt 1) { $location = $args -join ' ' }

		if ($location -eq '.') { $location = Get-Location }

		return Move-ToPackagedLocation $location
	}
}

Set-Alias -Name go -Value Open-Location -Scope Global
