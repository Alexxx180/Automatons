function Get-RecentNewLocation { return @{ new = 'Enter new location' } }

function Get-RecentLocations { return $script:recent }

function New-RecentLocations {
	$script:recent = [System.Collections.Generic.List[HashTable]]::new()
	$script:recent.Add((Get-RecentNewLocation))
}

New-RecentLocations
