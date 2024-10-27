function Clear-RecentLocations {
	Process {
		(Get-RecentLocations).Clear()
		New-RecentLocations
	}

	End { return 'Recent locations cleared' }
}
