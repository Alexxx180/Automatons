function Grant-RecentLocations {
	$script:rows = Get-RecentLocationKeys
	return $script:rows
}

function Move-ToRecentLocation {
	Process {
		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $script:rows
	}
}

function Select-RecentLocation {
	Param(
		[ValidateScript({
			($_ -ge 1) -and ($_ -le (Get-RecentLocations).Count)
		})]
		[Parameter(Mandatory=$true)][int] $no
	)

	Process {
		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $script:rows[$no - 1]
	}
}
