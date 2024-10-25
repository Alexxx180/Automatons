function Move-ToLocationFromList {
	Param(
		[Parameter(Mandatory=$true)]
		[System.Collections.Generic.List[HashTable]] $dirs,
		[Parameter(Mandatory=$true)][int] $no
	)

	Process {
		[HashTable] $dir = $dirs[$no]

		if (Test-Path $dir.location -PathType Container) {
			Set-Location $dir.location
			return "Go to '$($dir.alias)' - '$($dir.location)'"
		} else {
			$dirs.RemoveAt($no)
			return "Break '$($dir.alias)' - '$($dir.location)'"
		}
	}
}
