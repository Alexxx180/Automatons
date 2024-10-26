function Grant-RecentLocations {
	$script:rows = Get-RecentLocationKeys
	return $script:rows
}

function Select-RecentLocation {
	Param(
		[ValidateScript({
			($_ -ge 0) -and ($_ -le (Get-RecentLocations).Count)
		})]
		[Parameter(Mandatory=$true)][int] $no
	)

	Process {
		if ($no -eq 0) { return New-RecentLocation }

		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $script:rows[$no]
	}
}
