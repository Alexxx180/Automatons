<#
.SYNOPSIS
	Go to recent location from list
.DESCRIPTION
	Go to location from list by number
.PARAMETER No
	The integer number of recent location presented in the list
.EXAMPLE
	C:\PS> Select-RecentLocation 0
	Error - can not use 0 to specify values from list
.EXAMPLE
	C:\PS> Select-RecentLocation 1
	Go to the location with 1 number specified in the list
.NOTES
	Author: Tatarintsev Aleksander
	Date:   October 27, 2024
#>
function Select-RecentLocation {
	Param(
		[ValidateScript({
			((Get-RecentLocations).Count -gt 0) -and ($_ -ge 1) -and ($_ -le (Get-RecentLocations).Count)
		})]
		[Parameter(Mandatory=$true)][int] $no
	)

	Process {
		[string[]] $rows = Get-RecentLocationKeys
		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $rows[$no - 1]
	}
}

Set-Alias -Name gf -Value Select-RecentLocation -Scope Global
