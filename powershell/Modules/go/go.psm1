function Open-Location {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		if ($args.Count -gt 1) { $location = $args -join ' ' }

		if ($location -eq '.') { $location = Get-Location }

		return Move-ToPackagedLocation $location
	}
}

Set-Alias -Name go -Value Open-Location -Scope Global
