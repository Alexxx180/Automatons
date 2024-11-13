function Merge-PublishCommands {
	[CmdletBinding()]
	Param([Parameter(Mandatory=$true, ValueFromPipeLine=$true)] $params)

	Begin {
		[string[]] $cmd = Get-ExportConfig
	}

	Process {
		$keyword = $PSItem[0]
		$realvar = $PSItem[1]

		$cmd = $cmd | Expand-Command $keyword $realvar
	}

	End {
		return $cmd
	}
}
