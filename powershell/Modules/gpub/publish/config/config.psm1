function Get-PublishConfig {
	Process {
		if (-not $script:config) {
			[string] $path = "$PSScriptRoot/config.psd1"
			$script:config = Import-PowershellDataFile $path
		}
		return $script:config
	}
}

function Get-ExportConfig {
	Process {
		if (-not $script:export) {
			$script:export = Get-Content "$PSScriptRoot/export.txt"
		}
		return $script:export
	}
}
