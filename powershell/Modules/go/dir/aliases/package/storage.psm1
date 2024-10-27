function Get-PackagedLocations { return $script:dir }

function New-PackagedLocations {
	$script:dir = @{ root = '/' }
}

function Set-PackagedLocationsConfig {
	$path = "$PSScriptRoot/../../../path.psd1"

	if (Test-Path $path) {
		$script:config = Import-PowershellDataFile $path
	} else {
		return "Can't import: $path"
	}
}

function Import-PackagedLocations {
	Process {
		foreach ($p in $script:config['.']) {
			if (Test-Path $p -PathType Container) {
				New-PackagedLocation $p
			}
		}
	}
}

function Import-AliasedLocations {
	Process {
		foreach ($p in $script:config['..'].GetEnumerator()) {
			if (Test-Path $p.Value -PathType Container) {
				$script:dir.Add($p.Name, $p.Value)
			}
		}
	}
}

function Import-LocationsFromConfig {
	Process {
		if (-not $script:config) {
			Set-PackagedLocationsConfig
			if (-not $script:config) { return }
		}
		if ($script:config.Contains('.')) {
			Import-PackagedLocations
		}
		if ($script:config.Contains('..')) {
			Import-AliasedLocations
		}
	}
}

New-PackagedLocations
