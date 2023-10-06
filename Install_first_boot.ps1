# Install_first_boot.ps1

# List of essential software to be installed on first boot
$essentials = @(
    'Git.Git',
    'Microsoft.PowerShell'
)

# Function to install software using winget
function Install-Software ($softwareID) {
    Write-Host "Installing $softwareID..."
    winget install --id=$softwareID --accept-package-agreements --accept-source-agreements --exact
    Write-Host "$softwareID installed."
}

# Install each essential software
foreach ($software in $essentials) {
    Install-Software -softwareID $software
}

Write-Host "First boot installations complete."
