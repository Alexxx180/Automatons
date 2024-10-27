function Edit-RecentLocations {
	Param([string] $location)

	Process {
		[string] $nothing = Get-NoLocations
		$result = Pop-RecentLocation

		if ($result -eq $nothing) {
			return New-RecentLocation $location
		}

		return $result
	}
}
