function Clear-RecentLocations {
	Begin { $recent = Get-RecentLocations }

	Process {
		$recent.Clear()
		$recent.Add((Get-RecentNewLocation))
	}

	End { return 'Recent locations cleared' }
}
