function Register-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if (Assert-BrokenLocation $location) { return Get-NoLocations }

		$alias = Search-ForAlias $location
		if ($alias -eq $null) { return Get-NoDescription }

		[HashTable] $locations = Get-PackagedLocations
		[string] $key = $alias.ToString()
		$locations.$key = $location

		Set-Location $locations[$key]
		return $key
	}
}
