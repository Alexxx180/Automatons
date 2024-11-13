@{
	RootModule = 'rengine.psm1'
	ModuleVersion = '1.0'
	GUID = '07295207-d53b-4431-8d25-4fd110f92e5d'
	Author = 'Tatarintsev Aleksandr'
	CompanyName = 'EX-Digits'
	Copyright = '(c) 2024 Tatarintsev Aleksandr. All rights reserved.'
	Description = 'Optimized godot binaries builder'
	PowerShellVersion = '5.1'
	NestedModules = @(
		'dengine/location/location.psm1'
		'dengine/install/install.psm1'
		'rengine/submit/move.psm1'
		'rengine/submit/test.psm1'
		'rengine/submit/invoke.psm1'
		'rengine/start/approve/android.psm1'
		'rengine/start/approve/approve.psm1'
		'rengine/start/submit.psm1'
		'rengine/start/initialize.psm1'
	)
	VariablesToExport = '*'
}
