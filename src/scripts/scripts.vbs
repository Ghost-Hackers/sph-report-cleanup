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

Sub OpenSubroutine(fileName)
    On Error Resume Next
    Dim WshShell, fso, subPath
    Set WshShell = CreateObject("WScript.Shell")
    Set fso = CreateObject("Scripting.FileSystemObject")
    subPath = fso.GetAbsolutePathName("../subroutines/" & fileName)
    WshShell.Run Chr(34) & subPath & Chr(34), 1, False
    If Err.Number <> 0 Then
        MsgBox "Failed to open subroutine window: " & fileName, vbExclamation + vbOKOnly, "Error"
    End If
    On Error GoTo 0
End Sub