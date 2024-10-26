function Get-LocationCommands { return $script:commands }

[HashTable] $script:commands = @{
	[ScriptBlock] h = { return Get-LocationCommandsHelp }
	source = @{
		[ScriptBlock] c = { return Get-Clipboard }
	}
	all = @{
		[ScriptBlock] r = { return Clear-PackagedLocations }
		[ScriptBlock] l = { return Write-PackagedLocations }
	}
	selection = @{
		[ScriptBlock] d = {
			Param([string] $alias)
			Invoke-LocationOperation (Get-DropLocations) $alias
		}
		[ScriptBlock] y = {
			Param([string] $alias)
			Invoke-LocationOperation (Get-YankLocations) $alias
		}
	}
}
