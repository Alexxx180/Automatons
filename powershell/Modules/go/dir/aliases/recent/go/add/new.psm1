function New-RecentLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Begin {
		$recent = Get-RecentLocations
		$stoplist = @((Get-NoLocations), (Get-NoDescription))
	}

	Process {
		$alias = Register-PackagedLocation $location
		if ($alias -in $stoplist) { return $alias }

		# Write-Output $alias
		$recent.$alias = $location

		return "New '$alias' - '$location'"
	}
}
