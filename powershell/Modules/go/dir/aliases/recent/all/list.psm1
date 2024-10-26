function Write-RecentLocations {
	Param([System.Collections.ICollection] $keys)

	Begin { $recent = Get-RecentLocations }

	Process {
		if (-not $keys) { $keys = Get-RecentLocationKeys }

		for ([int] $i = 0; $i -le $keys.Count; $i += 1) {
			[string] $key = $keys[$i]
			Write-Output "$($i + 1).`t$key`t$($recent[$key])"
		}
	}
}
