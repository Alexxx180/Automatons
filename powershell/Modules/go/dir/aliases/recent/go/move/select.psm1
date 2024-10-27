function Move-ToRecentLocation {
	Process {
		[string] $row = Get-RecentLocationKeys
		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $row
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
		[string[]] $rows = Get-RecentLocationKeys
		[HashTable] $recent = Get-RecentLocations
		return Move-ToLocationRow $recent $rows[$no - 1]
	}
}
