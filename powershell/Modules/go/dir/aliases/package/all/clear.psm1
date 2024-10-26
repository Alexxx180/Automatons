function Clear-PackagedLocations {
	Begin { $dirs = Get-PackagedLocations }

	Process { $dir.Clear() }

	End { return 'Locations cleared' }
}
