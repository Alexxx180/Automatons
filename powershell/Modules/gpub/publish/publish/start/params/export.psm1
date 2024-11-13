function Get-ExportParameters {
	Param(
		[Parameter(Mandatory=$true)][string] $name,
		[ValidateScript({
			(Get-PublishConfig).ContainsKey($PSItem)
		})][string] $platform
	)

	Process {
		$preset = Get-PlatformPreset $platform
		$build = Get-GameBuild $name $platform

		return @(
			@('\$preset', $preset), @('\$build', $build)
		) | Merge-PublishCommands
	}
}
