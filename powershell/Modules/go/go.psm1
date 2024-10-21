[System.Collections.Generic.List[HashTable]] $script:dir = [System.Collections.Generic.List[HashTable]]::new()

function Rename-PackagedLocation {
	Param([Parameter(Mandatory=$true)])

	Process {
		return $alias
	}
}

# /, , ?, *, :, ", <, >, |

function Push-PackagedLocation {
	Param(
		[Parameter(Mandatory=$true)]
		[string] $location
	)

	Process {
		if (-not (Test-Path $location)) {
			return "Doesn't exist: '$location'"
		}

		[string] $alias = Rename-PackagedLocation $location
		return "Alias '$alias' created for '$location'"
	}
}

function Move-ToPackagedLocation {
	Param([Parameter(Mandatory=$true)][string] $location)

	Process {
		Set-Location $location
	}
}

[HashTable] $script:result = @{
	[ScriptBlock] cb = { return Get-Clipboard }
}

[HashTable] $script:all = @{
	[ScriptBlock] r = { $script:dir.Clear() }
}

[HashTable] $script:selection = @{
	[ScriptBlock] d = { Param($dir) $script:dir.Remove($dir) }
	[ScriptBlock] y = { Param($dir) Set-Clipboard $script:dir.$dir }
}

function Switch-LocationCommands {
	Param([string] $command)

	Process {
		if (-not $command) { return $false }
		if ($command[0] -ne ':') {
			return $false
		}

		[string] $command = $command.Substring(1)
		[ScriptBlock] $action = $script:cmds.$command

		if (-not $action) { return $false }

		$action.Invoke()
		return $true
	}
}

function Move-ToLocation {
	Param([string] $command, [string] $location)

	Process {
		
	}

}

Set-Alias -Name go -Value Move-ToLocation -Scope Global
