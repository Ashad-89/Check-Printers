$Printers = Import-Csv ".\printers.csv"

$Results = foreach ($Printer in $Printers)
{
    $Online = Test-Connection `
        -ComputerName $Printer.IPAddress `
        -Count 2 `
        -Quiet

    [PSCustomObject]@{
        PrinterName = $Printer.PrinterName
        IPAddress   = $Printer.IPAddress
        Location    = $Printer.Location
        Online      = $Online
        DateChecked = Get-Date
    }
}

$Results |
Export-Csv ".\PrinterStatus.csv" `
-NoTypeInformation

$Results

$Body = @"
Printer Monitor Report

Please find the attached report.

Generated: $(Get-Date)
"@

$Credential = Get-Credential

Send-MailMessage `
    -From "ash9932@hotmail.co.uk" `
    -To "ash9932@hotmail.co.uk" `
    -Subject "Weekly Printer Report" `
    -Body $Body `
    -Attachments ".\PrinterStatus.csv" `
    -SmtpServer "smtp.office365.com" `
    -Port 587 `
    -UseSsl `
    -Credential $Credential
