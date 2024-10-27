function Enter-SelectionCommand {
	Param(
		[Parameter(Mandatory=$true)][ScriptBlock] $command,
		[Parameter(Mandatory=$true)][string] $selection
	)
	Process { $command.Invoke($selection) }
}

function Group-SelectionCommand {
	Param([ScriptBlock] $command, [string] $selection)
	Process {
		if (-not $selection) {
			return Enter-SelectionCommand $operation
		}
		return Enter-SelectionCommand $command $selection
	}
}

function Group-SourceCommand {
	Param([string] $source)
	Process {
		if (Assert-BrokenLocation $source) {
			return Get-NoLocations
		}
		return Move-ToPackagedLocation $source
	}
}

function Switch-LocationCommands {
	Param([Parameter(Mandatory=$true)][string] $command, [string] $selection)

	Begin { $commands = Get-LocationCommands }

	Process {
		$command = $command -replace '/', ''

		if ($commands.Contains($command)) {
			return $commands.$command.Invoke()
		}
		if ($commands.all.Contains($command)) {
			return $commands.all.$command.Invoke()
		}
		if ($commands.selection.Contains($command)) {
			[ScriptBlock] $operation = $commands.selection.$command
			return Group-SelectionCommand $operation $selection
		}
		if ($commands.source.Contains($command)) {
			return Group-SourceCommand $commands.source.$command.Invoke()
		}
		return $commands.h.Invoke()
	}
}

Set-Alias -Name lc -Value Switch-LocationCommands -Scope Global
