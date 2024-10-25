function Get-LocationCommands { return $script:commands }

[HashTable] $script:commands = @{
	source = @{
		[ScriptBlock] c = { return Get-Clipboard }
	}
	all = @{
		[ScriptBlock] r = { return Clear-PackagedLocations }
		[ScriptBlock] l = { return Write-PackagedLocations }
	}
	selection = @{
		[ScriptBlock] d = { Param($dir) $script:dir.Remove($dir) }
		[ScriptBlock] y = { Param($dir) Set-Clipboard $script:dir.$dir }
	}
}
