@{
	builds = "user/builds/godot/games"
	pack = "user/builds/godot/release"

	windows = @{
		preset = "Windows Desktop"
		extension = "exe"
		pack = "nsis/create.nsi"
	}
	android = @{
		preset = "Android"
		extension = "aab"
	}
	apk = @{
		preset = "Android-APK"
		extension = "apk"
	}
}

