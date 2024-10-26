function Get-RootPackagedLocation { return $script:root }

function Get-PackagedLocations { return $script:dir }

$script:root = @{ root = '/' }
$script:dir = [System.Collections.Generic.List[HashTable]]::new()
$script:dir.Add((Get-RootPackagedLocation))
