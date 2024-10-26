function Get-PackageSearcher {
	Param([HashTable] $locations)

	Process {
		return @{
			exists = $false
			index = $locations.Count
			keys = $locations.Keys -split "`n"
			key = ''
		}
	}
}
