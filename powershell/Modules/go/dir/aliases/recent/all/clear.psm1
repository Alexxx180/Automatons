function Clear-RecentLocations {
	Begin { $recent = Get-RecentLocations }

	Process { $recent.Clear() }

	End { return 'Recent locations cleared' }
}
