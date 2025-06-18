# Set the console title
$host.ui.RawUI.WindowTitle = "Synxis Property Hub Reports Cleanup"

param(
    [switch]$NonInteractive = $false
)

Trap {
    Write-Output "ERROR: $($_.Exception.Message)"
    Continue
}
Write-Output "Script started"

# Message to display at the top of the console
Write-Output "Beginning search for Synxis Reports (PDF) remaining in the downloads folder. Please wait."

# Search for files matching "sph*.pdf" recursively
$searchPath = Join-Path $env:USERPROFILE 'Downloads'
$files = Get-ChildItem -Path $searchPath -Filter "sph*.pdf" -Recurse -ErrorAction SilentlyContinue
$totalFiles = $files.Count

if ($totalFiles -eq 0) {
    Write-Output " "
    Write-Output "No files found."
    Write-Output " "
    Write-Output "Script complete"
    exit
}

# Progress bar
$i = 0
foreach ($file in $files) {
    $i++
    $percentComplete = [math]::Round(($i / $totalFiles * 100), 0)
    $hashCount = [math]::Round($percentComplete / 2.5)
    $progressBar = '#' * $hashCount + (' ' * (40 - $hashCount))
    Write-Progress -Activity "Progress" -Status "Searching for matching 'sph*.pdf' files in '$searchPath'..." -PercentComplete $percentComplete -CurrentOperation "$percentComplete% Complete" -StatusDescription $progressBar
    Start-Sleep -Milliseconds 100
}

# Display the list of files that match
Write-Output " "
Write-Output "Search completed for PDF files that begin with 'sph' in '$searchPath'..."
Write-Output " "
Write-Output "Located $totalFiles file(s)."
$totalSizeMB = [math]::Round(($files | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
Write-Output "Total File Size: $totalSizeMB MB"
Write-Output " "

# Warn if large number or size of files
if ($totalFiles -gt 100 -or $totalSizeMB -gt 100) {
    Write-Output "WARNING: You are about to delete a large number or size of files!"
    Write-Output " "
    if ($NonInteractive) {
        $extraConfirm = 'Y'
    } else {
        $extraConfirm = Read-Host "Are you absolutely sure you want to continue? (Y/N)"
    }
    if ($extraConfirm -ne 'Y' -and $extraConfirm -ne 'y') {
        Write-Output "Operation cancelled by user."
        Write-Output " "
        Write-Output "Script complete"
        exit
    }
}

Write-Output "List of File(s) found:"
$files | ForEach-Object { Write-Output $_.FullName }

# Ask for confirmation
Write-Output " "
Write-Output "Please confirm cleanup."
Write-Output "WARNING: This action cannot be undone. Files will be permanently deleted."
Write-Output " "
if ($NonInteractive) {
    $confirmation = 'Y'
} else {
    $confirmation = Read-Host "Would you like to delete the above-listed files? (Y/N)"
}

# Offer to move to Recycle Bin instead of permanent delete
Write-Output " "
$recycleOption = $false
if ($confirmation -eq 'Y' -or $confirmation -eq 'y') {
    Write-Output "Would you like to move the files to the Recycle Bin instead of permanently deleting them? (Y/N)"
    if ($NonInteractive) {
        $recycleResponse = 'N'
    } else {
        $recycleResponse = Read-Host "Move to Recycle Bin? (Y/N)"
    }
    if ($recycleResponse -eq 'Y' -or $recycleResponse -eq 'y') {
        $recycleOption = $true
        # Ensure Recycle module is available
        if (-not (Get-Module -ListAvailable -Name Recycle)) {
            Write-Output "Installing 'Recycle' module for Recycle Bin support..."
            Install-Module -Name Recycle -Scope CurrentUser -Force
        }
        Import-Module Recycle
    }
}

if ($confirmation -eq 'Y' -or $confirmation -eq 'y') {
    $deleted = 0
    $deletedSize = 0
    $failedFiles = @()
    foreach ($file in $files) {
        try {
            $deletedSize += $file.Length
            if ($recycleOption) {
                # Move to Recycle Bin
                Remove-RecycleBinItem -Path $file.FullName -ErrorAction Stop
            } else {
                Remove-Item -Path $file.FullName -Recurse -Force -ErrorAction Stop
            }
            $deleted++
        } catch {
            $failedFiles += $file.FullName
            Write-Output "Failed to delete: $($file.FullName) ($_)."
        }
    }
    $deletedSizeMB = [math]::Round($deletedSize / 1MB, 2)
    Write-Output " "
    if ($failedFiles.Count -eq 0) {
        Write-Output "User accepted. Files deleted successfully."
    } else {
        Write-Output "User accepted. Some files could not be deleted:"
        $failedFiles | ForEach-Object { Write-Output $_ }
        Write-Output " "
        Write-Output "Possible reasons: file is in use, access denied, or insufficient permissions."
    }
    Write-Output "Files deleted: $deleted"
    Write-Output "Cleaned Up: $deletedSizeMB MB"
    Write-Output " "
    # Optionally log deleted and failed files
    $logPath = Join-Path $searchPath "SPH_Cleanup_Log_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    $logContent = @()
    $logContent += "SPH Report Cleanup Log - $(Get-Date)"
    $logContent += "Files deleted: $deleted"
    $logContent += "Cleaned Up: $deletedSizeMB MB"
    if ($failedFiles.Count -gt 0) {
        $logContent += "Failed to delete:"
        $logContent += $failedFiles
    }
    $logContent | Out-File -FilePath $logPath -Encoding UTF8
    Write-Output "Log saved to: $logPath"
    Write-Output " "
} else {
    Write-Output "User declined. No files were deleted."
    Write-Output "Files deleted: 0"
    Write-Output "Cleaned Up: 0 MB. Space remaining to be cleaned: $totalSizeMB MB"
    Write-Output " "
}

Write-Output "Script complete"