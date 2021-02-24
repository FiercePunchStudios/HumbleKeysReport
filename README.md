# HumbleKeysReport
Humble Keys Report is an extension script for [Playnite](https://playnite.link/) that reports on the redeemed status of Humble Bundle keys as returned by [FiercePunchStudios/HumbleKeysLibrary](https://github.com/FiercePunchStudios/HumbleKeysLibrary) extension.

This will help in sorting your redeemed and unredeemed keys, so that you can give away your extra copies or redeem games you may have forgotten!

## Installation
1. Download the .pext file from the [latest release](https://github.com/FiercePunchStudios/HumbleKeysReport/releases)
2. Drag-and-drop the .pext file onto your Playnite window.

## Details
### Columns
* `Source` - this column shows what platform the game belongs to. This report is only concerned with `Humble Keys`, so entries with other sources can be ignored.
* `Is Redeemed?` - this column will display `Redeemed` or `Unredeemed`, corresponding to the tags filled out by HumbleKeysLibrary in the Playnite UI.
* `Links` - this column contains all links stored in Playnite for this game, including the Humble Purchase URL. This should help you find and obtain unredeemed games from the Humble site more easily.

### Usage
You can use the reports in a variety of ways, but I recommend this sequence.
1. Once installed, simply run the report by clicking the `Playnite logo in the top-left -> Extensions -> Humble Keys Report`. Output to text or CSV file.
2. Open your CSV file in spreadsheet software like LibreOffice.
3. Add your own column to store the game keys that you will obtain in step 6.
4. Sort the spreadsheet by the `Is Redeemed?` column and find the rows marked `Unredeemed`.
5. If there is a link to humblebundle.com in the `Links` tab, navigate to it and follow the redemption instructions.
6. Copy the game key back into the column you created in step 3.

Now you have a spreadsheet of unredeemed keys to redeem for yourself or distribute to your friends!

## Roadmap
* It may be worth trying to determine whether a given game entry in the library is unique. What a user would do with an unredeemed game might change depending on whether they already own that game via another entry.
