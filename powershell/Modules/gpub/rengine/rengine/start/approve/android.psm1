function Approve-AndroidBuild {
	Begin {
		[HashTable] $location = Get-EngineLocation
		[string] $source = $location.engine.source
		[string] $platform = $location.platforms.android
	}

	Process {
		[string] $path = Join-Path $source $platform

		if (-not (Test-Path $path)) {
			return "No such platform path '$path'"
		}

		if (-not (Test-Path "$path/gradlew")) {
			return "No 'gradlew' found on path '$path'"
		}

		Push-Location $path
		.\gradlew generateGodotTemplates
		Pop-Location

		return "Generated Godot Templates"
	}
}
