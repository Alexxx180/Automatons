function Get-YankLocations { return $script:operations }

$script:operations = @{
	directory = {
		Param($dirs, [int] $no)
		if ($no -eq 0) {
			[string] $dir = (Get-Location).Drive.Root
		} else {
			[string] $dir = $dirs[$no]
		}
		Set-Clipboard $dir
		return 'Copied to clipboard.'
	}
	recent = Get-NoRecentFeedback
}
