Sub Window_OnLoad
    ' Set the size of the window based on content
    window.resizeTo document.body.scrollWidth + 20, document.body.scrollHeight + 40
    ' Center the window on the screen
    window.moveTo (screen.width - document.body.clientWidth) \ 2, (screen.height - document.body.clientHeight) \ 2
End Sub

Sub Continue
    ' Handle the "Continue" button click event
    MsgBox "User chose to continue. Performing the next action...", vbInformation + vbOKOnly, "SPH Report Cleanup Information"

    ' Run the Batch Script
    RunBatchScript

    ' Close the HTA window
    window.close
End Sub

Sub RunBatchScript
    ' Create a WshShell object
    Set WshShell = CreateObject("WScript.Shell")

    ' Specify the path to your Batch Script
    BatchScriptPath = "/SPH Report Cleanup.bat"

    ' Run the Batch Script
    WshShell.Run """" & BatchScriptPath & """", 0, False
End Sub

Sub DisplayReadmeMessages
    ' Display a series of messages before opening the README link
    MsgBox "Thank you for choosing to read our README file. This will provide you with important information about the script.", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "Please take a moment to review the README document to better understand the features, usage, and any additional instructions.", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "We appreciate your interest and encourage you to reach out if you have any questions or feedback.", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "Your web browser will open to our README on GitHub momentarily.", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "Please wait for the Ghost team to hack your browser...", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "3 ghosts are working hard to open your web browser...", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "2 ghosts are working hard to redirect your web browser...", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "1 ghost has obtained complete control your web browser...", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "Redirect link uploaded to the browser...", vbInformation + vbOKOnly, "SPH Report Cleanup"
    MsgBox "Launching web browser to Ghost Hackers on GitHub...", vbInformation + vbOKOnly, "SPH Report Cleanup"
    ' Open the specified URL in the default web browser
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "https://github.com/Ghost-Hackers/sph-report-cleanup/tree/master"
End Sub

Sub EmailUs
    ' Handle the "Email Us" button click event
    ' Open the default email client with a pre-filled email
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "mailto:ghost-hackers@outlook.com?subject=SPH%20Report%20Cleanup%20Feedback"
End Sub

Sub ReportIssue
    ' Handle the "Report Issue" button click event
    ' Open the specified URL in the default web browser
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "https://github.com/Ghost-Hackers/sph-report-cleanup/issues"
End Sub

Sub RequestFeature
    ' Handle the "Request Feature" button click event
    ' Open the specified URL in the default web browser
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "https://github.com/Ghost-Hackers/sph-report-cleanup/issues"
End Sub

Sub ShowCustomMessageBox()
    ' Display the custom message box
    document.getElementById("customMessageBox").style.display = "block"
End Sub

Sub CloseCustomMessageBox()
    ' Close the custom message box
    document.getElementById("customMessageBox").style.display = "none"
End Sub