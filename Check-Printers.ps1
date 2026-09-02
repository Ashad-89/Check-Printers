# Import the printer list from CSV
$Printers = Import-Csv "C:\Users\Swytch Admin\Desktop\Home Printer Health Check Automation\printers.csv"

# Loop through each printer and test connectivity
$Results = foreach ($Printer in $Printers) {

    $Online = Test-Connection `
        -ComputerName $Printer.IPAddress `
        -Count 2 `
        -Quiet

    [PSCustomObject]@{
        PrinterName  = $Printer.PrinterName
        IPAddress    = $Printer.IPAddress
        Location     = $Printer.Location
        Online       = $Online
        DateChecked  = Get-Date
    }
}

# Export results to CSV
$Results | Export-Csv `
    "C:\Users\Swytch Admin\Desktop\Home Printer Health Check Automation\PrinterStatus.csv" `
    -NoTypeInformation

# Display results in the console
$Results
