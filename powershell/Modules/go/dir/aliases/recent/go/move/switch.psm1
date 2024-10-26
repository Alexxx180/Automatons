function Switch-RecentLocations {
	Param([switch] $new)

	Begin { $recent = Get-RecentLocations }

	Process {
		if ($new) { return New-RecentLocation }

		if ($recent.Count -eq 0) {
			return Get-NoLocations
		}

		$rows = Grant-RecentLocations

		if ($recent.Count -eq 1) {
			return Move-ToRecentLocation
		}

		Write-RecentLocations $rows
		return Select-RecentLocation
	}
}

Set-Alias -Name gr -Value Switch-RecentLocations -Scope Global
