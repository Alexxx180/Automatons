function Pop-RecentLocation {
	Param([switch] $new)

	Begin {
		$recent = Get-RecentLocations
		$count = $recent.Count
	}

	Process {
		if ($new) { return New-RecentLocation }

		if ($count -eq 0) { return Get-NoLocations }

		if ($count -eq 1) { return Move-ToRecentLocation }

		return Write-RecentLocations
	}
}

Set-Alias -Name gr -Value Pop-RecentLocation -Scope Global
Set-Alias -Name gf -Value Select-RecentLocation -Scope Global
