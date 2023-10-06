# Load Windows Forms Assembly
Add-Type -AssemblyName System.Windows.Forms

# Read the updates_available.txt file
$updatesAvailable = Get-Content "C:\path\to\updates_available.txt"

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

# Check if updates are available
if ($updatesAvailable -eq "true") {
    # Create a dialog box to ask the user to install updates now or later
    $result = [System.Windows.Forms.MessageBox]::Show(
        'Updates are available. Would you like to install them now?',
        'Updates Available',
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Question
    )

    # Check the user's choice
    if ($result -eq 'Yes') {
        # Run winget to update all packages
        winget upgrade --all
    }
}
