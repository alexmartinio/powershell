# Check if elevated
#Requires -RunAsAdministrator

$SMTPServer = "smtp.example.co.uk"
$SMTPPort = 25
$EmailFrom = "pswu@example.co.uk"
$EmailTo = "user@example.co.uk"

Try {
    Import-Module -Name PSWindowsUpdate -ErrorAction Stop
}
Catch {
    Write-Warning "Could not find 'PSWindowsUpdate' module... attempting install.."
    Install-Module -Name PSWindowsUpdate
    Import-Module -Name PSWindowsUpdate -ErrorAction Stop
}

$PSWUSettings = @{SmtpServer=$SMTPServer;From=$EmailFrom;To=$EmailTo;Port=$SMTPPort}
Get-WUInstall -Install -AcceptAll -AutoReboot -MicrosoftUpdate -PSWUSettings $PSWUSettings -SendReport -SendHistory -Verbose -Debuger