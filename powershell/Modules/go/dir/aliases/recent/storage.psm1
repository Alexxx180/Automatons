function Get-RecentLocations { return $script:recent }

function Get-RecentLocationKeys { return ($script:recent.Keys -split "`n") }

function New-RecentLocations {
	$script:recent = @{}
}

New-RecentLocations
