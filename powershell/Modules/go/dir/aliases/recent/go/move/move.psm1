function Move-ToRecentLocation {
	Process {
		[string] $row = Get-RecentLocationKeys
		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $row
	}
}
