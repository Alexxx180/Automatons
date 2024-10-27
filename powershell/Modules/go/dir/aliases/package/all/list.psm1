function Write-PackagedLocations {
	Begin {
		$locations = Get-PackagedLocations
		$dirs = [System.Text.StringBuilder]::new()
	}

	Process {
		foreach ($key in $locations.Keys) {
			$dirs.Append($key).Append("`t") > $null
		}
	}

	End { return $dirs.ToString() }
} # /, , ?, *, :, ", <, >, |
