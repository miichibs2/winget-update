# Initialize
$updatesAvailable = $false

# Check for updates
Write-Host "Checking for updates..."
$updates = winget upgrade
if ($updates -match "No installed package found") {
    Write-Host "No updates available."
    $updatesAvailable = $false
} else {
    Write-Host "Updates available."
    $updatesAvailable = $true
}

# Write the updates status to updates_available.txt
if ($updatesAvailable) {
    "true" | Out-File -FilePath "C:\Skripts\updates_available.txt"
} else {
    "false" | Out-File -FilePath "C:\Skripts\updates_available.txt"
}
