function Export-GameProduct {
	Param(
		[Parameter(Mandatory=$true)][string] $name,
		[ValidateScript({
			(Get-PublishConfig).ContainsKey($PSItem)
		})][string] $platform
	)

	Begin {
		[string] $app = 'godot'
		[string] $project = "project.$app"
	}

	Process {
		if (-not (Test-Path $project)) {
			Write-Error "Operation failed: no $project found"
		}

		[string[]] $params = Get-ExportParameters $name $platform

		Write-Output "$app $params"

		Start-Process -FilePath $app -ArgumentList $params -Wait
	}
}

Set-Alias -Name exgame -Value Export-GameProduct -Scope Global
