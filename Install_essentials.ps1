# Install Git
Write-Host "Installing Git..."
winget install --id=Git.Git -e --accept-package-agreements --accept-source-agreements

# Update Winget
Write-Host "Updating Winget..."
winget upgrade --id=Microsoft.Winget -e --accept-package-agreements --accept-source-agreements

# Clone your GitHub repository
Write-Host "Cloning GitHub repository..."
git clone https://github.com/miichibs2/winget-update.git -b test "C:\Skripts"

Write-Host "Installation of essential tools and downloading of repository complete."

# Optional: Show a notification that installation is complete.
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show('Essential tools and repository have been installed.', 'Installation Complete')
