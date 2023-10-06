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

# Check if first_boot_finished.txt exists and its value
$firstBootFile = "C:\Skripts\first_boot_finished.txt"
$firstBootStatus = $false
if (Test-Path $firstBootFile) {
    $firstBootStatus = Get-Content $firstBootFile -Raw
}

# Run Install_first_boot.ps1 if necessary and update first_boot_finished.txt
if ($firstBootStatus -eq "false" -or -not (Test-Path $firstBootFile)) {
    Write-Host "Running Install_first_boot.ps1..."
    .\Install_first_boot.ps1
    "true" | Out-File -FilePath $firstBootFile
}
