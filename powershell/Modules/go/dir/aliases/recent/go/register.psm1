function Add-RecentLocation {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $dir,
		[Parameter(Mandatory=$true)][string] $alias
	)

	Begin { $recent = Get-RecentLocations }

	Process {
		if ($dir.alias -like "*$alias*") { $recent.Add($dir) }
	}
}
