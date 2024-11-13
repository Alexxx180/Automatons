function Install-ForWindows {
	Param([Parameter(Mandatory=$true)][string] $name)

	Process {
		$installer = Test-InstallForWindows $name

		[HashTable] $make = $installer.make

		Write-Output "[WIN] Pack: $($installer.pack), Make: $make"

		& $installer.pack.app $installer.pack.build

		Start-Process $make.app -ArgumentList $make.cfg -Wait
	}
}

Set-Alias -Name gwinstall -Value Install-ForWindows -Scope Global
