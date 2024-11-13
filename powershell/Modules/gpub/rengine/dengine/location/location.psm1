$script:location = $null

function Get-EngineLocation {
	Process {
		if (-not $script:location) {
			[string] $path = "$PSScriptRoot/location.psd1"
			$script:location = Import-PowerShellDataFile $path
		}

		return $script:location
	}
}

Set-Alias -Name lsgame -Value Get-EngineLocation -Scope Global
