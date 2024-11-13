function Get-GamePackager {
	Param([string] $platform)

	Process {
		[HashTable] $target = Get-PublishConfig
		[string] $pack = $target.pack

		if ($target.$platform.pack) {
			$pack += "/$($target.$platform.pack)"
		}

		return $pack
	}
}
