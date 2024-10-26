function Get-YankLocations { return $script:operations }

$script:operations = @{
	directory = {
		Param($dirs, [int] $no)
		Set-Clipboard $dirs[$no]
		return 'Copied to clipboard.'
	}
	recent = Get-NoRecentFeedback
}
