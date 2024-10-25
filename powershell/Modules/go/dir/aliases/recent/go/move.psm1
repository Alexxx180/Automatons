function Move-ToRecentLocationByNumber {
	Param(
		[ValidateScript({
			($_ -ge 1) -and ($_ -le (Get-RecentLocations).Count)
		})]
		[Parameter(Mandatory=$true)][int] $no
	)

	Process { Move-ToLocationFromList (Get-RecentLocations) ($no - 1) }
}

function Move-ToRecentLocations {
	Begin { $recent = Get-RecentLocations }

	Process {
		if ($recent.Count -eq 0) {
			return Get-NoLocations
		}
		if ($recent.Count -eq 1) {
			return Move-ToRecentLocationByNumber 1
		}
		Write-RecentLocations
		return Move-ToRecentLocationByNumber
	}
}
