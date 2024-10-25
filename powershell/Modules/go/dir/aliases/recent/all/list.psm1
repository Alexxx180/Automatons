function Write-RecentLocations {
	Begin { $recent = Get-RecentLocations }

	Process {
		for ([int] $i = 0; $i -le $recent.Count; $i += 1) {
			[HashTable] $dir = $recent[$i]
			Write-Output "$($i + 1).`t$($dir.alias)`t$($dir.location)"
		}
	}
}
