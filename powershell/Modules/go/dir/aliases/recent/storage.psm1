function Get-RecentNewLocation { return $script:new }

function Get-RecentLocations { return $script:recent }

$script:new = @{ new = 'Enter new location' }
$script:recent = [System.Collections.Generic.List[HashTable]]::new()
$script:recent.Add($script:new)
