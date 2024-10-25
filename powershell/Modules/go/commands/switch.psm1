function Switch-LocationCommands {
	Param([string] $command, [string] $selection)

	Begin { $commands = Get-LocationCommands }

	Process {
		if ($commands.all.Contains($command)) {
			return $commands.all.$command.Invoke()
		}
		if ($commands.selection.Contains($command)) {
			return $commands.selection.$command.Invoke($selection)
		}
		if ($commands.source.Contains($command)) {
			[string] $source = $commands.source.$command.Invoke()
			return Move-ToPackagedLocation $source
		}
		return 'Use :h for help'
	}
}
