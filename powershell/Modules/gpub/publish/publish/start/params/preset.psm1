function Get-PlatformPreset {
	Param([Parameter(Mandatory=$true)][string] $platform)

	Begin { $config = Get-PublishConfig }

	Process {
		if (-not $config.$platform) {
			return "No platform found"
		}
		if (-not $config.$platform.preset) {
			return "No preset found"
		}

		return $config.$platform.preset
	}
}
