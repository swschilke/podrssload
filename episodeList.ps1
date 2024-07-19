 If ($args[0] -ne $null) {
 $tempstring= $args[0].ToString()
 $regEx="^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
iF ( $tempstring -match $regex) {
 [xml]$feed = Invoke-WebRequest -Uri $args[0].ToString()
 Write-Host " "
 Write-Host "Podcast Rss Feed is " $args[0].ToString()
 Write-Host " "
 Write-Host "Downloading Podcast " $feed.rss.channel.title.ToString()
 Write-Host " "
 Write-Host "Number of Episodes =" $Feed.rss.channel.Item.count
 Write-Host " "
 Write-Host "Listing Podcast Episodes"
 Write-Host " "
 for ($i=0;$i -lt $Feed.rss.channel.Item.count;$i++) {
    $n = $i#+1
    Write-Host $n". " $feed.rss.channel.Item[$i].title.ToString()
    } }
    else
        {Write-Host " "
         Write-Host "Invalid URL"
         Write-Host " "}}
    else 
    {
    Write-Host " "
    Write-Host "USAGE: episodeList <URL to RSS Feed>"
    Write-Host " "}
    