function Clear-LocationPath {
	Param([Parameter(Mandatory=$true)][string] $location)

	Begin {
		[string] $delimiter = '/'
	}

	Process {
		$location = $location -replace '\\', $delimiter
		if ($location[-1] -eq $delimiter) {
			$location = $location.Substring(0, $location.Length - 1)
		}
		return $location
	}
}
