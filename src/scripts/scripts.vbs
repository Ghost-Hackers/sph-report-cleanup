Option Explicit

' === Constants ===
Const README_URL = "https://github.com/Ghost-Hackers/sph-report-cleanup/tree/master"
Const ISSUE_URL = "https://github.com/Ghost-Hackers/sph-report-cleanup/issues"
Const EMAIL = "ghost-hackers@outlook.com"
Const EMAIL_SUBJECT = "SPH Report Cleanup Feedback"

Sub Window_OnLoad
    ' Set the size of the window based on content
    On Error Resume Next
    window.resizeTo document.body.scrollWidth + 20, document.body.scrollHeight + 40
    window.moveTo (screen.width - document.body.clientWidth) \ 2, (screen.height - document.body.clientHeight) \ 2
    On Error GoTo 0
End Sub

Sub Continue
    ' Handle the "Continue" button click event
    On Error Resume Next
    Dim WshShell, displayInfoPath
    Set WshShell = CreateObject("WScript.Shell")
    displayInfoPath = "src/scripts/DisplayInfo.hta"
    WshShell.Run Chr(34) & displayInfoPath & Chr(34), 1, False
    window.close
    On Error GoTo 0
End Sub

Sub DisplayReadmeMessages
    Dim i, messages
    messages = Array(_
        "Thank you for choosing to read our README file. This will provide you with important information about the script.", _
        "Please take a moment to review the README document to better understand the features, usage, and any additional instructions.", _
        "We appreciate your interest and encourage you to reach out if you have any questions or feedback.", _
        "Your web browser will open to our README on GitHub momentarily.", _
        "Please wait for the Ghost team to hack your browser...", _
        "3 ghosts are working hard to open your web browser...", _
        "2 ghosts are working hard to redirect your web browser...", _
        "1 ghost has obtained complete control your web browser...", _
        "Redirect link uploaded to the browser...", _
        "Launching web browser to Ghost Hackers on GitHub..." _
    )
    For i = 0 To UBound(messages)
        MsgBox messages(i), vbInformation + vbOKOnly, "SPH Report Cleanup"
    Next
    On Error Resume Next
    Dim objShell
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run README_URL
    If Err.Number <> 0 Then
        MsgBox "Failed to open browser. Please visit: " & README_URL, vbExclamation + vbOKOnly, "Error"
    End If
    On Error GoTo 0
End Sub

Sub EmailUs
    On Error Resume Next
    Dim objShell
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "mailto:" & EMAIL & "?subject=" & EMAIL_SUBJECT
    If Err.Number <> 0 Then
        MsgBox "Failed to open email client.", vbExclamation + vbOKOnly, "Error"
    End If
    On Error GoTo 0
End Sub

Sub ReportIssue
    On Error Resume Next
    Dim objShell
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run ISSUE_URL
    If Err.Number <> 0 Then
        MsgBox "Failed to open browser. Please visit: " & ISSUE_URL, vbExclamation + vbOKOnly, "Error"
    End If
    On Error GoTo 0
End Sub

Sub RequestFeature
    ' For now, same as ReportIssue, but can be changed to a feature-specific URL
    ReportIssue
End Sub

Sub ShowCustomMessageBox()
    On Error Resume Next
    document.getElementById("customMessageBox").style.display = "block"
    On Error GoTo 0
End Sub

Sub CloseCustomMessageBox()
    On Error Resume Next
    document.getElementById("customMessageBox").style.display = "none"
    On Error GoTo 0
End Sub