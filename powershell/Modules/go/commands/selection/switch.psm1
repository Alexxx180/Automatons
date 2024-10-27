function Select-LocationCommand {
	Param(
		[Parameter(Mandatory=$true)][ScriptBlock] $command,
		[Parameter(Mandatory=$true)][string] $alias
	)

	Process {
		if ($alias -eq ':c') { $alias = Get-Clipboard }
		return $command.Invoke($alias)
	}
}
