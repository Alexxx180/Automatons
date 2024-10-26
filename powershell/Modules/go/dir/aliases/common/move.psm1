function Move-ToLocationRow {
	Param(
		[Parameter(Mandatory=$true)][HashTable] $dirs,
		[Parameter(Mandatory=$true)][string] $alias
	)

	Process {
		[string] $location = $dirs[$alias]

		if (Assert-BrokenLocation $location) {
			$dirs.Remove($dir)
			return "Break '$alias' - '$location'"
		}

		Set-Location $location
		return "Go to '$alias' - '$location'"
	}
}
