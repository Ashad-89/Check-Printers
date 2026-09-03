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

$ReportFolder = "C:\PrinterMonitor\Reports"

if (!(Test-Path $ReportFolder))
{
    New-Item -ItemType Directory -Path $ReportFolder
}

$TimeStamp = Get-Date -Format "yyyy-MM-dd-HHmm"

$Results |
Export-Csv `
"$ReportFolder\PrinterStatus-$TimeStamp.csv" `
-NoTypeInformation
