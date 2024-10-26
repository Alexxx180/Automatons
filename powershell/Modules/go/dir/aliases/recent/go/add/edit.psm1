function Edit-RecentLocations {
	Param([string] $location)

	Process {
		[string] $nothing = Get-NoLocations
		[string] $switched = Switch-RecentLocations

		if ($switched -eq $nothing) {
			return New-RecentLocation $location
		}

		return $switched
	}
}
