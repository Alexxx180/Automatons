function Get-ResultBranches {
	Param([HashTable] $tree)
	Process {
		return Get-ChildItem "$($tree.item.FullName)/*$($tree.alias)*"
	}
}

function Complete-BranchPath {
	Param([HashTable] $tree)
	Process {
		while ($tree.item -and (-not $tree.branches)) {
			$tree.path.Insert(0, '/').Insert(0, $tree.item.Name) > $null
			$tree.item = $tree.item.Parent
			$branches = Get-ResultBranches $tree
		}
	}
}

function Step-FirstBranchItem {
	Param([HashTable] $tree)
	Process {
		$tree.path.Append($item.Name) > $null
		$tree.item = $tree.item.Parent
		if ($tree.item) { $tree.branches = Get-ResultBranches $tree }
	}
}

function Use-LocationBranch {
	Param(
		[ValidateScript({
			($_ -ne '.') -and ($_ -ne '..')
		})]
		[Parameter(Mandatory=$true)][string] $alias
	)

	Process {
		$tree = @{
			alias = $alias
			item = Get-Item (Get-Location)
			path = [System.Text.StringBuilder]::new()
		}
		Step-FirstBranchItem $tree
		Complete-BranchPath $tree

		if (-not $tree.branches) { return Get-NoLocations }

		if ($tree.branches.Count -eq 1) {
			Set-Location $tree.branches.FullName
		} else {
			Mount-RecentBranches $tree
			Write-RecentLocations
		}
	}
}

Set-Alias -Name gb -Value Use-LocationBranch -Scope Global
