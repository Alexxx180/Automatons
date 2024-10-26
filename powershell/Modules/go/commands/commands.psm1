function Get-LocationCommands { return $script:commands }

[HashTable] $script:commands = @{
	h = { return Get-LocationCommandsHelp }
	source = @{
		c = { return Get-Clipboard }
	}
	all = @{
		r = { return Clear-PackagedLocations }
		l = { return Write-PackagedLocations }
	}
	selection = @{
		d = {
			Param([string] $alias)
			Invoke-LocationOperation (Get-DropLocations) $alias
		}
		y = {
			Param([string] $alias)
			Invoke-LocationOperation (Get-YankLocations) $alias
		}
	}
}
