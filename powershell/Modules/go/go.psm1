function Open-Location {
	Param([Parameter(Mandatory=$true)][string] $command)

	Process {
		if ($command[0] -eq ':') {
			return Switch-LocationCommands $command.Substring(1, 2)
		}
		return Move-ToPackagedLocation $command
	}
}

Set-Alias -Name go -Value Open-Location -Scope Global
