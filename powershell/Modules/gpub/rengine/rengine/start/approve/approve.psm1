function Approve-BuildFinalizer {
	Param([string] $name)

	Process {
		if ($script:finalizer.$name) {
			$script:finalizer[$name].Invoke()
		}
	}
}

$script:finalizer = @{
	android2d = { Approve-AndroidBuild }
}
