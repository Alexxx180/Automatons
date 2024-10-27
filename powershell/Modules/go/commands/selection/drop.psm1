function Set-DropLocation([string] $selection) {
	Begin { $locations = Get-PackagedLocations }

	Process {
		if ($selection -eq 'root') {
			return "Can't remove root location"
		}
		if (-not $locations.Contains($selection)) {
			return Get-NoLocations
		}
		[string] $location = $locations[$selection]
		$locations.Remove($selection)
		return "Removed '$selection' - '$location'"
	}
}
