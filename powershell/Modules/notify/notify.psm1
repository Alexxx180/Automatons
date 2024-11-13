Add-Type -AssemblyName System.Windows.Forms

<#
.SYNOPSIS
	Show pop-up message
.DESCRIPTION
	Show pop-up message notification
.PARAMETER Description
	Message description text
.PARAMETER Title
	Message title text
.EXAMPLE
	C:\PS> Show-Message 'Sample'
	Show notification with description 'Sample' and no title
.EXAMPLE
	C:\PS> Show-Message 'Sample' 'Text'
	Show notification with description 'Sample' and title 'Text'
.NOTES
	Author: Tatarintsev Aleksander
	Date:   November 13, 2024
#>
function Show-Message {
	Param([string] $description, [string] $title = 'Attention')

	Process {
		$path = (Get-Process -id $pid).Path
		$message = New-Object System.Windows.Forms.NotifyIcon
		$message.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
		$message.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
		$message.BalloonTipText = $description
		$message.BalloonTipTitle = $title
		$message.Visible = $true
		$message.ShowBalloonTip(5000)
	}

}

Set-Alias -Scope Global -Name notify -Value Show-Message
