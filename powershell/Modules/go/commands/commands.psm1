function Get-LocationCommands { return $script:commands }

[HashTable] $script:commands = @{
	h = { return Get-LocationCommandsHelp }
	source = @{
		c = { return Get-Clipboard }
	}
	all = @{
		r = { return Clear-PackagedLocations }
		l = { return Write-PackagedLocations }
		i = { return Import-LocationsFromConfig }
		'.' = {
			Set-Clipboard (Get-Location).Path
			return 'Copied to clipboard.'
		}
	}
	selection = @{
		d = { Param([string] $alias) Set-DropLocation $alias }
		y = { Param([string] $alias) Get-YankLocation $alias }
	}
}
