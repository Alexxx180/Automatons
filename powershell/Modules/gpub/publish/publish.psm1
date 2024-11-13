<#
.SYNOPSIS
Publish product as signed exe installer.
.DESCRIPTION
Publish product as signed exe installer.
Takes lowercase name for product config.
.PARAMETER Name
Specifies the product name.
.INPUTS
None. You cannot pipe objects to Publish-Product.
.OUTPUTS
System.String. Publish-Product returns a procedure text log.
.EXAMPLE
PS> Publish-Product -Name papresent
.EXAMPLE
PS> publish papresent
#>
function Publish-Product {
	Param(
		[Parameter(Mandatory=$true)][string] $name,
		[ValidateScript({
			(Get-PublishConfig).ContainsKey($PSItem)
		})][string] $platform
	)

	Process {
		Export-GameProduct $name $platform -ErrorAction Stop

		Start-PublishFinalizerIfAny $name $platform

		return "Operation finished successfully"
	}
}

Set-Alias -Name 'publish' -Value Publish-Product -Scope Global
