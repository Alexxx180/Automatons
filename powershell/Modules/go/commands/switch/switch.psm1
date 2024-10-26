function Switch-LocationCommands {
	Param([string] $command, [string] $selection)

	Begin { $commands = Get-LocationCommands }

	Process {
		if ($commands.Contains($command)) {
			return $commands.$command.Invoke()
		}
		if ($commands.all.Contains($command)) {
			return $commands.all.$command.Invoke()
		}
		if ($commands.selection.Contains($command)) {
			return Select-LocationCommand $commands.selection.$command
		}
		if ($commands.source.Contains($command)) {
			[string] $source = $commands.source.$command.Invoke()
			return Move-ToPackagedLocation $source
		}
		return $commands.h.Invoke()
	}
}
