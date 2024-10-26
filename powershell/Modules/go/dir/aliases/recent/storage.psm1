function Get-RecentLocations { return $script:recent }

function Get-RecentLocationKeys { return $script:recent.Keys }

function New-RecentLocations {
	$script:recent = @{ new = 'Enter new location' }
}

New-RecentLocations
