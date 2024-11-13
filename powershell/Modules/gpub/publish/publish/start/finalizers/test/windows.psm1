function Test-InstallForWindows {
	Param([Parameter(Mandatory=$true)][string] $name)

	Begin {
		[string] $platform = 'windows'
		[string] $pack = Get-GamePackager $platform
	}

	Process {
		$installer = @{
			pack = @{
				app = 'upx'
				build = Get-GameBuild $name $platform
			}
			make = @{
				app = 'makensis'
				cfg = @("/DPRODUCT_CONFIG=$name", $pack)
			}
		}
		return $installer
	}
}
