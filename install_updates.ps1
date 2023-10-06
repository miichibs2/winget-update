# Read the updates_available.txt file
$updatesAvailable = Get-Content "C:\path\to\updates_available.txt"

Add-Type -AssemblyName System.Windows.Forms
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
# Note: This script requires the Windows Forms assembly to be loaded.
# You may need to add the following line at the top of your script:
# Add-Type -AssemblyName System.Windows.Forms
