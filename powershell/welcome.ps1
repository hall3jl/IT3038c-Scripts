Add-Type -AssemblyName PresentationFramework

#Script to gather geolocation data provided by colsw from StackOverflow @ https://stackoverflow.com/a/46287884
Add-Type -AssemblyName System.Device #Required to access System.Device.Location namespace
$GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher #Create the required object
$GeoWatcher.Start() #Begin resolving current locaton

while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) {
    Write-Host "Cannot retreive location data. Sleeping 100ms."
    Start-Sleep -Milliseconds 100 #Wait for discovery.
}  

if ($GeoWatcher.Permission -eq 'Denied'){
    [System.Windows.MessageBox]::Show("Access Denied for Location Information", "Error", "Ok", "Error")
    exit
} else {
    $LatLong = $GeoWatcher.Position.Location | Select Latitude,Longitude #Select the relevent results.
}

#Store latitude and longitude to variable
$Latitude=$LatLong.Latitude
$Longitude=$LatLong.Longitude

try {
#Retrieve weather information based on current location
$uri="https://api.weather.gov/points/$Latitude,$Longitude"
$WeatherJSON=Invoke-RestMethod -Method GET -Uri $uri 

#Retrieve forecast information
$uri=$WeatherJSON.properties.forecast
$ForecastJson=Invoke-RestMethod -Method GET -Uri $uri 
} Catch {
    [System.Windows.MessageBox]::Show("Error accessing Weather.gov`r`n`r`nMore Details: $_", "Error", "Ok", "Error")
    exit
}

#Store human readable location information
$City=$WeatherJson.properties.relativeLocation.properties.city
$State=$WeatherJson.properties.relativeLocation.properties.state

#Get the most recent forcast
$CurrentForecast=$ForecastJson.properties.periods | Where-Object {$_.number -eq 1}
$CurrentWeatherPeriod=$CurrentForecast.name.toLower()
$CurrentDetailedForecast=$CurrentForecast.detailedForecast

#Get user information
#Command provided by TheCleaner from StackOverflow @ https://serverfault.com/a/582710
$UserFullName=Get-WMIObject Win32_UserAccount | where caption -like *\$env:USERNAME | Select-Object -ExpandProperty FullName

#Get date and time information
$Date=Get-Date -Format "dddd, MMMM dd, yyyy"
$Time=Get-Date -Format "h:mtt"

#Write greeting to user
$Message="Hello, $UserFullName. Today is $Date. The time is $Time.`r`nThe weather forecast $CurrentWeatherPeriod in $City, $State is $CurrentDetailedForecast"
[System.Windows.MessageBox]::Show("$Message", "Greetings", "Ok", "Information")