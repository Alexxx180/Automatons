function Mount-RecentBranches {
	Param([HashTable] $tree)

	Begin {
		Clear-RecentLocations
		$recent = Get-RecentLocations
	}

	Process {
		[string] $path = $tree.path.ToString()

		$tree.branches | ForEach-Object {
			[string] $full = Join-Path $PSItem.FullName $path
			if (Test-Path $full) {
				$recent.Add($PSItem.Name, $full)
			} else {
				$recent.Add($PSItem.Name, $PSItem.FullName)
			}
		}
	}
}
