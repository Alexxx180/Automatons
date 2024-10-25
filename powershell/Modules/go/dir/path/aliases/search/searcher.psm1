function Get-AliasSearcher {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		return @{
			[string] location = $location
			[int] index = $location.Length
			alias = [System.Text.StringBuilder]::new()
		}
	}
}
