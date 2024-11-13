function Optimize-Build {
	Param([HashTable] $config)

	Begin {
		[string] $path = $(Get-EngineLocation).engine.source
	}

	Process {
		[System.Collections.Generic.List[string]] $params = Test-OptimizeBuildShort $config

		if ($config.template) {
			$params.Add("$($config.template)=yes")
		} else {
			[System.Collections.Generic.List[string]] $template = Test-OptimizeBuildTemplate $config
			$params.AddRange($template)
		}

		Write-Output $params

		Push-Location $path

		Start-Process scons -ArgumentList $params -Wait

		Pop-Location
	}

}
