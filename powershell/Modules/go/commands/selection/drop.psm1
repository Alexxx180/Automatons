function Get-DropLocations { return $script:operations }

$script:operations = @{
	directory = {
		Param($dirs, [int] $no)
		[HashTable] $dir = $dirs[$no]
		$dirs.Remove($dir)
		return "Removed '$($dir.alias)' - '$($dir.location)'"
	}
	recent = Get-NoRecentFeedback
}
