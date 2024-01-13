# Set the console title
$host.ui.RawUI.WindowTitle = "Synxis Property Hub Reports Cleanup"

# Message to display at the top of the console
Write-Host "Beginning search for Synxis Reports (PDF) remaining in the downloads folder. Please wait."

# Search for files matching "sph*.pdf" recursively
$files = Get-ChildItem -Path $env:USERPROFILE\Downloads -Filter "sph*.pdf" -Recurse
$totalFiles = $files.Count
$i = 0
foreach ($file in $files) {
    $i++
    $percentComplete = [math]::Round(($i / $totalFiles * 100), 0)
    $hashCount = [math]::Round($percentComplete / 2.5)  # Adjust the divisor to control the width of the progress bar
    $progressBar = '#' * $hashCount + (' ' * (40 - $hashCount))  # 40 characters total width

    Write-Progress -Activity "Progress" -Status "Searching for matching 'sph*.pdf' files in 'C:\Users\%userprofile%\Downloads'..." -PercentComplete $percentComplete -CurrentOperation "$percentComplete% Complete" -StatusDescription $progressBar
    Start-Sleep -Seconds 2
}

# Display the list of files that match
Write-Host "Search completed for PDF files that begin with 'sph' in 'C:\Users\%userprofile%\Downloads'..."
$filesToDisplay = Get-ChildItem -Path $env:USERPROFILE\Downloads -Filter "sph*.pdf" -Recurse | Select-Object -ExpandProperty FullName
if (@($filesToDisplay).Count -eq 0) {
    Write-Host " "
    Write-Host "No files found."
    Write-Host " "
    Read-Host -Prompt "Press Enter to exit"
} else {
    Write-Host " "
    Write-Host "Located $(@($filesToDisplay).Count) file(s)."
    Write-Host "Total File Size: $(($filesToDisplay | Measure-Object -Sum Length).Sum / 1MB) MB"
    Write-Host " "
    Write-Host "List of File(s) found:"
    $filesToDisplay | ForEach-Object { Write-Host $_ }

    # Ask for confirmation
    Write-Host " " 
    Write-Host "Please confirm cleanup."
    Write-Host "WARNING: This action cannot be undone. Files will be permanently deleted."
    Write-Host " "
    $confirmation = Read-Host "Would you like to delete the above-listed files? (Y/N)"

    # Check the user's choice
    if ($confirmation -eq 'Y' -or $confirmation -eq 'y') {
        # User confirmed, proceed with deletion
        foreach ($file in $filesToDisplay) {
            Remove-Item -Path $file -Recurse -Force
        }
        Write-Host 'User accepted. Files deleted successfully.'
        Write-Host "Files deleted: $(@($filesToDisplay).Count)"
        Write-Host "Cleaned Up: $(($filesToDisplay | Measure-Object -Sum Length).Sum / 1MB) MB"
        Write-Host " "
        Read-Host -Prompt "Press Enter to exit"
    } else {
        # User declined, do nothing
        Write-Host 'User declined. No files were deleted.'
        Write-Host "Files deleted: 0"
        Write-Host "Cleaned Up: 0 MB. Space remaining to be cleaned: $(($filesToDisplay | Measure-Object -Sum Length).Sum / 1MB) MB"
        Write-Host " "
        Read-Host -Prompt "Press Enter to exit"
    }
}