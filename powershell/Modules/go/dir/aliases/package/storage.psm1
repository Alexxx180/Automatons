function Get-RootPackagedLocation { return @{ root = '/' } }

function Get-PackagedLocations { return $script:dir }

function New-PackagedLocations {
	$script:dir = [System.Collections.Generic.List[HashTable]]::new()
	$script:dir.Add((Get-RootPackagedLocation))
}

New-PackagedLocations
