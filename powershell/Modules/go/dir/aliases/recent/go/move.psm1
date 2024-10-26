function Move-ToRecentLocationByNumber {
	Param(
		[ValidateScript({
			($_ -ge 0) -and ($_ -le (Get-RecentLocations).Count)
		})]
		[Parameter(Mandatory=$true)][int] $no
	)

	Process {
		if ($no -eq 0) {
			return Register-PackagedLocation
		} else {
			return Move-ToLocationFromList (Get-RecentLocations) $no
		}
	}
}

function Move-ToRecentLocations {
	Begin { $recent = Get-RecentLocations }

	Process {
		if ($recent.Count -le 1) {
			return Get-NoLocations
		}
		if ($recent.Count -eq 2) {
			return Move-ToRecentLocationByNumber 1
		}
		Write-RecentLocations
		return Move-ToRecentLocationByNumber
	}
}

Set-Alias -Name gr -Value Move-ToRecentLocations -Scope Global
