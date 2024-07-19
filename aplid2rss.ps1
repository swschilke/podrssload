If ($args[0] -ne $null) {
$tempstring= $args[0].ToString()
$regEx="^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
iF ( $tempstring -match $regex) {
$id = $tempstring.ToString().Substring($tempstring.ToString().LastIndexOf('id')+2)
Write-Host " "
Write-Host "Apple Podcast ID is   " $id
$querystring="https://itunes.apple.com/lookup?id=" + $id.ToString() + "&entity=podcast"
$aplpod = Invoke-RestMethod $querystring.ToString()
Write-Host " "
Write-Host "Podcast Titel is      " $aplpod.results.collectionName.ToString()
Write-Host " "
Write-Host "Podcast RSS feed is   " $aplpod.results.feedUrl.ToString()}
else 
    {Write-Host " "
     Write-Host "Invalid URL"
     Write-Host " "}
}
else 
    {Write-Host " "
     Write-Host "USAGE: aplid2rss <URL to Apple Podcast Entry>"
     Write-Host " "}