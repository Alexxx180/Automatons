function Get-AliasSearcher {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		return @{
			location = $location
			index = $location.Length
			alias = [System.Text.StringBuilder]::new()
		}
	}
}
