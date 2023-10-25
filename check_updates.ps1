# Wert wird auf false gesetzt
$updatesAvailable = $false

# Nach updates suchen
Write-Host "updates werden gesucht..."
$updates = winget update
if ($updates -match "No installed package found") {
    Write-Host "keine updates verfügbar."
    $updatesAvailable = $false
} else {
    Write-Host "Updates verfügbar."
    $updatesAvailable = $true
}

# Ja/Nein in updates_available.txt schreiben
if ($updatesAvailable) {
    "true" | Out-File -FilePath "C:\Skripts\updates_available.txt"
} else {
    "false" | Out-File -FilePath "C:\Skripts\updates_available.txt"
}
