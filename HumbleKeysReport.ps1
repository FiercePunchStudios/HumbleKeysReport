function global:ExportHumbleKeysReport()
{
    $path = $PlayniteApi.Dialogs.SaveFile("CSV|*.csv|Formated TXT|*.txt")
    if ($path)
    {
        # regex pattern from https://stackoverflow.com/questions/47096341/check-if-string-is-in-list-of-strings
        $redeemedTagPattern = '^Key: Redeemed|^Redeemed'
        $unredeemedTagPattern = '^Key: Unredeemed|^Unredeemed'
        $anyTagPattern = $redeemedTagPattern + '|' + $unredeemedTagPattern

        $gamesWithKeyTags = $PlayniteApi.Database.Games | Where-Object {GameHasTagInPattern $_ $anyTagPattern } |
          Select Name, Source,
            @{ n='Is Redeemed?'; e={ TagToString $_ $redeemedTagPattern $unredeemedTagPattern 'Redeemed' 'Unredeemed' } },
            @{ n='Links'; e={ $_.Links.Url -join ' ' } },
            @{ n='Tags'; e={ '#' + ($_.Tags -join ' #') } }

        $output = if($path -match ".csv$") { $gamesWithKeyTags | ConvertTo-Csv } else { $gamesWithKeyTags | Format-Table -AutoSize }
        $output | Out-File $path -Encoding utf8

        $PlayniteApi.Dialogs.ShowMessage("Humble Keys Report exported successfully.");
    }
}

function GameHasTagInPattern($game, $pattern)
{
    # Equivalent to list.Any() from https://stackoverflow.com/questions/1499466/powershell-equivalent-of-linq-any
    return $game.Tags.Where({$_ -match $pattern}, 'First').Count -gt 0
}

function TagToString($game, $redeemedPattern, $unredeemedPattern, $redeemedResult, $unredeemedResult)
{
    if (GameHasTagInPattern $game $redeemedPattern) { return $redeemedResult }
    if (GameHasTagInPattern $game $unredeemedPattern) { return $unredeemedResult }
    return ''
}
