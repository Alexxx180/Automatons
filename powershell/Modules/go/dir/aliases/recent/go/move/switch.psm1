function Switch-RecentLocations {
	Param([switch] $new)

	Begin { $recent = Get-RecentLocations }

	Process {
		if ($new) { return New-RecentLocation }

		if ($recent.Count -le 1) {
			return Get-NoLocations
		}

		$rows = Grant-RecentLocations

		if ($recent.Count -eq 2) {
			return Select-RecentLocation 1
		}

		Write-RecentLocations $rows
		return Select-RecentLocation
	}
}

Set-Alias -Name gr -Value Move-ToRecentLocations -Scope Global
