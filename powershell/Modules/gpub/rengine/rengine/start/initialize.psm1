function Initialize-EngineBuild {
	Param(
		[Parameter(Mandatory=$true)][string] $template,
		[string] $platform
	)

	Process {
		if ($platform) {
			return Submit-EngineBuild "$template/$platform.psd1"
		}

		Get-ChildItem "$template/*.psd1" | ForEach-Object {
			Submit-EngineBuild $PSItem.FullName
		}
	}
}
