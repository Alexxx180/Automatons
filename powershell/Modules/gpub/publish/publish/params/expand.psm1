function Expand-Command {
	Param(
		[Parameter(Mandatory=$true)][string] $keyword,
		[Parameter(Mandatory=$true)][string] $realvar,
		[Parameter(ValueFromPipeLine=$true)] $commands
	)

	Process { return $PSItem -replace $keyword, $realvar }
}
