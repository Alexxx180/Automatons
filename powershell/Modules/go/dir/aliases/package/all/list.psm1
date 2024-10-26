function Write-PackagedLocations {
	Begin {
		$locations = Get-PackagedLocations
		$dirs = [System.Text.StringBuilder]::new()
	}

	Process {
		foreach ($key in $locations.Keys) {
			$dirs.Append($key).Append("`t")
		}
	}

	End { return $dirs.ToString() }
} # /, , ?, *, :, ", <, >, |
