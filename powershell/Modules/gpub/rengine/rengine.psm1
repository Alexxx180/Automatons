function Mount-EngineBuild {
	Param(
		[ValidateSet('', '2d')]
		[string] $template,
		[ValidateSet('', 'windows', 'android')]
		[string] $platform
	)

	Begin {
		[string] $templates = "$PSScriptRoot/templates"
	}

	Process {
		if ($template) {
			[string] $path = "$templates/$template"
			return Initialize-EngineBuild $path $platform
		}

		Get-ChildItem $templates | ForEach-Object {
			Initialize-EngineBuild $PSItem.FullName $platform
		}
	}
}

Set-Alias -Name rengine -Value Mount-EngineBuild -Scope Global
