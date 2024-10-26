function Get-PackageSearcher {
	Param([HashTable] $locations)

	Process {
		return @{
			exists = $false
			index = $locations.Length
			keys = $locations.Keys
			key = ''
		}
	}
}
