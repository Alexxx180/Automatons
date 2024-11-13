function Get-GameBuild {
	Param(
		[Parameter(Mandatory=$true)][string] $name,
		[ValidateScript({
			(Get-PublishConfig).ContainsKey($PSItem)
		})][string] $platform
	)

	Process {
		[HashTable] $target = Get-PublishConfig
		[HashTable] $os = $target.$platform

		[string] $builds = $os.builds

		if (-not $builds) {
			$builds = "$($target.builds)/$platform"
		}

		[string] $extension = $os.extension
		[string] $dirbuild = "$builds/$name"

		if (-not (Test-Path $dirbuild)) {
			New-Item $dirbuild -ItemType Directory > $null
		}

		return "$dirbuild/$name.$extension"
	}
}
