function Move-Binaries {
	Param([Parameter(Mandatory=$true)][HashTable] $config)

	Begin {
		[HashTable] $location = Get-EngineLocation
		[HashTable] $engine = $location.engine
	}

	Process {
		[string] $template = $config.build.template
		[string] $platform = $config.build.platform
		[string] $architecture = $config.build.architecture

		[string] $launchString = "$template/$platform/$architecture"
		Write-Verbose "Completed '$launchString'"

		$bin = Join-Path $engine.source $engine.binaries
		$output = Join-Path $location.output $launchString

		if (-not (Test-Path $output)) {
			New-Item $output -ItemType Directory -Force
		}

		Get-ChildItem $bin | ForEach-Object {
			$path = Join-Path $output $PSItem.Name
			Move-Item $PSItem.FullName $path -Force
		}
	}
}
