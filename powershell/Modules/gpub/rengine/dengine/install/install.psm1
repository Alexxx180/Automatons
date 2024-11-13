function Install-EngineSource {
	Begin {
		[HashTable] $location = Get-EngineLocation
		[string] $path = $location.engine.source
	}

	Process {
		if (-not (Test-Path $path)) {
			New-Item $path -ItemType Directory -Force
		}

		Write-Output "Sync source code to '$path'"

		Push-Location $path

		[string] $branch = $location.engine.version

		if (-not $branch) { $branch = 'master' }

		if (-not (Test-Path '.git')) {
			git init
			git remote add origin $location.engine.repo
			git checkout -b $branch
		} else {
			git checkout $branch
		}

		git pull origin $branch

		Pop-Location
	}
}

Set-Alias -Name dengine -Value Install-EngineSource -Scope Global
