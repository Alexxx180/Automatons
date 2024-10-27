function Clear-PackagedLocations {
	Process {
		(Get-PackagedLocations).Clear()
		New-PackagedLocations
	}

	End { return 'Locations cleared' }
}
