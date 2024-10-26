function Register-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if (Assert-BrokenLocation $location) { return Get-NoLocations }

		$alias = Search-ForAlias $location
		if ($alias -eq $null) { return Get-NoDescription }

		[string] $key = $alias.ToString()
		(Get-PackagedLocations).$key = $location

		return $key
	}
}
