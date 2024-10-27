function Write-RecentLocations {
	Begin {
		$recent = Get-RecentLocations
		$keys = Get-RecentLocationKeys
	}

	Process {
		[int] $no = 0
		return $keys | ForEach-Object {
			$no += 1
			[PSCustomObject]@{
				no = $no
				alias = $PSItem
				path = $recent[$PSItem]
			}
		}
	}
}
