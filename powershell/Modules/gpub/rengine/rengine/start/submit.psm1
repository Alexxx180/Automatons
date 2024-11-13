function Submit-EngineBuild {
	Param([Parameter(Mandatory=$true)][string] $path)

	Process {
		[HashTable] $config = Import-PowershellDataFile $path

		Optimize-Build $config

		$platform = $config.build.platform
		$template = $config.build.template
		$finalizer = $config.build.finalizer

		if ($finalizer) {
			Approve-BuildFinalizer $finalizer
		}

		Move-Binaries $config -Verbose

		return "Submitted build '$platform - $template'"
	}
}
