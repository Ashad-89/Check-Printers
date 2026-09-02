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
