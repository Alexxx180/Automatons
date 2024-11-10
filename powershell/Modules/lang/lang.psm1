<#
.SYNOPSIS
	Translate the specified word
.DESCRIPTION
	Translate the specified word to another language
.PARAMETER Text
	Text to translate
.PARAMETER Target
	Target language to translate text to
.PARAMETER Source
	Source language to translate text from
.PARAMETER Part
	Return only part of translator response,
	usually the word and its translation
.EXAMPLE
	C:\PS> Request-Translation one-example ru
	Translate text 'one-example' to the russian 'один пример'
.EXAMPLE
	C:\PS> Request-Translation образец -part
	Translate text 'образец' to the english 'sample'
	and return only part of translation data
.NOTES
	Author: Tatarintsev Aleksander
	Date:   October 27, 2024
#>
function Request-Translation {
    Param(
        [Parameter(Mandatory=$true)][string] $text,
        [string] $target = 'en', [string] $source = 'auto',
        [switch] $part
    )

    Begin {
        $api = "https://translate.googleapis.com/translate_a"
    }

    Process {
        $query = "$api/single?client=gtx&sl=$source&tl=$target&dt=t&q=$text"
        $uri = $query.replace(" ", "%20").replace("\", "\\")

        $response = Invoke-WebRequest -Uri $uri -Method Get
        $result = $response.content

        if ($part) {
            $start = $result.IndexOf('["') + 1
            $end = $result.IndexOf('",null') - 2
            $result = $result.substring($start, $end)
        }

        return $result
    }
}

Set-Alias -Name lang -Value Request-Translation
