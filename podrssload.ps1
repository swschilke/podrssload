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
 Invoke-WebRequest -Uri $args[0].ToString() -OutFile $args[0].ToString().Substring($args[0].ToString().LastIndexOf('/')+1)
 Write-Host "Downloading Podcast RSS"
 Write-Host " "
 for ($i=0;$i -lt $Feed.rss.channel.Item.count;$i++) {
    $n = $i+1
    Write-Host $n". Downloading MP3 " $feed.rss.channel.Item[$i].enclosure.url.Substring($feed.rss.channel.Item[$i].enclosure.url.LastIndexOf('/')+1)
    Invoke-WebRequest -Uri $feed.rss.channel.Item[$i].enclosure.url -OutFile $feed.rss.channel.Item[$i].enclosure.url.Substring($feed.rss.channel.Item[$i].enclosure.url.LastIndexOf('/')+1)
    }} 
    else
        {Write-Host " "
         Write-Host "Invalid URL"
         Write-Host " "}}
    else 
    {
    Write-Host " "
    Write-Host "USAGE: podrssload <URL to RSS Feed>"
    Write-Host " "}
    