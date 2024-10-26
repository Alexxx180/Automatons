function Clear-PackagedLocations {
	Begin { $dirs = Get-PackagedLocations }

	Process {
		$dirs.Clear()
		$dirs.Add((Get-RootPackagedLocation))
	}

	End { return 'Locations cleared' }
}
