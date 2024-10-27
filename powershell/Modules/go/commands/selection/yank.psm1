function Get-YankLocation([string] $selection) {
	Begin { $locations = Get-PackagedLocations }

	Process {
		if (-not $locations.Contains($selection)) {
			return Get-NoLocations
		}
		if ($selection -eq 'root') {
			[string] $location = (Get-Location).Drive.Root
		} else {
			[string] $location = $locations[$selection]
		}
		Set-Clipboard $location
		return 'Copied to clipboard.'
	}
}
