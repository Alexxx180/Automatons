function Write-PackagedLocations {
	Begin {
		$pack = Get-PackagedLocations
		$dirs = [System.Text.StringBuilder]::new()
	}

	Process {
		foreach ($dir in $pack) {
			$dirs.Append($dir.alias).Append("`t")
		}
	}

	End { return $dirs.ToString() }
} # /, , ?, *, :, ", <, >, |
