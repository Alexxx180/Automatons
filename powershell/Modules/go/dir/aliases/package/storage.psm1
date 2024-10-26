function Get-PackagedLocations { return $script:dir }

function New-PackagedLocations {
	$script:dir = @{ root = '/' }
}

New-PackagedLocations
