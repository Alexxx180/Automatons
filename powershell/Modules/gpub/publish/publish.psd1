@{
	RootModule = 'publish.psm1'
	ModuleVersion = '1.0'
	GUID = '9f133f4a-69c7-48cf-8d82-aa321544a08d'
	Author = 'Tatarintsev Aleksandr'
	CompanyName = 'EX-Digits'
	Copyright = '(c) 2024 Tatarintsev Aleksandr. All rights reserved.'
	Description = 'Publish project to specified platform'
	PowerShellVersion = '5.1'
	NestedModules = @(
		'config/config.psm1'
		'publish/params/expand.psm1'
		'publish/params/merge.psm1'
		'publish/start/params/build.psm1'
		'publish/start/params/preset.psm1'
		'publish/start/params/export.psm1'
		'publish/start/export.psm1'
		'publish/start/finalizers/packaging.psm1'
		'publish/start/finalizers/test/windows.psm1'
		'publish/start/finalizers/pack/windows.psm1'
		'publish/start/finalizers/finalizers.psm1'
	)
	VariablesToExport = '*'
}
