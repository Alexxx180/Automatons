$script:finalizers = @{
	windows = { Param($name) Install-ForWindows $name }
}

function Start-PublishFinalizerIfAny {
	Param(
		[Parameter(Mandatory=$true)][string] $name,
		[ValidateScript({
			(Get-PublishConfig).ContainsKey($PSItem)
		})] $platform
	)

	Process {
		$finalizer = $script:finalizers.$platform
		if ($finalizer) {
			$finalizer.Invoke($name)
		}
	}
}
