<#
.SYNOPSIS
	Go to the recent location
.DESCRIPTION
	Go to the recent location or get locations list if found more
.EXAMPLE
	C:\PS> Pop-RecentLocation
	Go to the recent location or get locations list if found more
.NOTES
	Author: Tatarintsev Aleksander
	Date:   October 27, 2024
#>
function Pop-RecentLocation {
	Begin {
		$recent = Get-RecentLocations
		$count = $recent.Count
	}

	Process {
		if ($count -eq 0) { return Get-NoLocations }

		if ($count -eq 1) { return Move-ToRecentLocation }

		return Write-RecentLocations
	}
}

Set-Alias -Name gr -Value Pop-RecentLocation -Scope Global
