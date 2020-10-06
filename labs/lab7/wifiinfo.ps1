Add-Type -AssemblyName PresentationFramework
Import-Module -Name WifiTools -WarningAction SilentlyContinue

# Example 1 "Show-WifiState" shows information about the currently connected wireless network
$WifiState = Show-WifiState

if ($WifiState.state -eq "connected") {
    $message = "Hello, you are currently connected to $($WifiState.SSID)."
    [System.Windows.MessageBox]::Show("$message", "WiFi-Info", "Ok", "Information")
    
    # Example 2 "Disconnect-Wifi" disconnects from the currently connected WiFi network
    $message = "Would you like to disconnect from $($WifiState.SSID)?"
    $msgboxinput = [System.Windows.MessageBox]::Show("$message", "WiFi-Info", "YesNoCancel", "Question")
    Switch ($msgboxinput) {
        'Yes' {
            Disconnect-Wifi
         }

        'No' {
         }

        'Cancel' {
            exit
         }
    }

} else {
    $message = "Hello! You are not connected to a WiFi network at this time."
    [System.Windows.MessageBox]::Show("$message", "Wifi-Info", "Ok", "Information")
}

# Example 3 "List-WifiProfiles" shows a list of all WiFi profiles stored on a device.
# Another command "Show-WifiProfilePassword" can actually show the password for networks using PSK's. Don't worry, you're UC password is safe though :)
$message = "Here is a list of all the wireless networks you've connected to on this device: `r`n$(List-WifiProfiles)"
[System.Windows.MessageBox]::Show("$message", "WiFi-Info", "Ok", "Information")