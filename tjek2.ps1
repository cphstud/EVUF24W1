# Define the parameters for the event
$source = "tjek.ps1"
$logName = "Application"
$eventID = 1000
$eventType = [System.Diagnostics.EventLogEntryType]::Information
$message = "Kurt was happy here"

# Check if the source exists, if not, create it
if (-not [System.Diagnostics.EventLog]::SourceExists($source)) {
    # Creating a new source requires administrative privileges
    [System.Diagnostics.EventLog]::CreateEventSource($source, $logName)
}

# Write the event to the event log
Write-EventLog -LogName $logName -Source $source -EventId $eventID -EntryType $eventType -Message $message
