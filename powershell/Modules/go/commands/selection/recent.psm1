function Get-NoRecentFeedback { return $script:recent }

$script:recent = @{
	save = $false
	edit = {
		Param([string] $alias)
		return "$(Get-NoLocations) with alias: $alias"
	}
}
