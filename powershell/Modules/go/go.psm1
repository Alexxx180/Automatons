function Open-Location {
	Param([Parameter(Mandatory=$true)][string] $command, [string] $location)

	Process {
		if ($command[0] -eq ':') {
			return Switch-LocationCommands $command.Substring(1, 2) $location
		}
		if ($location) {
			
		} else {
			
		}
	}

}

Set-Alias -Name go -Value Open-Location -Scope Global
