function New-AliasedLocation {
	Param(
		[Parameter(Mandatory=$true)][string] $alias,
		[Parameter(Mandatory=$true)][string] $location
	)

	Process {
		[HashTable] $locations = Get-PackagedLocations
		$locations.Add($alias, $location)
		return $alias
	}
}

function New-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		$alias = Search-ForAlias $location
		if ($alias -eq $null) { return Get-NoDescription }

		return New-AliasedLocation $alias.ToString() $location
	}
}

function Register-PackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if (Assert-BrokenLocation $location) { return Get-NoLocations }

		$item = Get-Item $location -ErrorAction Stop
		$location = Clear-LocationPath $item.FullName

		$key = New-PackagedLocation $location
		if ($key -ne (Get-NoDescription)) {
			Set-Location $location
		}

		return $key
	}
}
