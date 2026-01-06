# -----------------------------------------------------
# Konstante Basiskonfiguration – config.core.ps1
# -----------------------------------------------------

# [DEBUG]
$debugEnabled = $false

# Log-Verzeichnisse
$logDir1 = "C:\Macos\Logs\DMSQueue"
$logDir2 = "C:\Macos\Macos.Services.Dms"
$logDir3 = "C:\Macos\Macos.WebPks.UI.WebApi"        
$logDir4 = "C:\Macos\Printing\Test\Logs"                   # PROD: C:\Macos\Printing\Logs  # Test: C:\Macos\Printing\Test\Logs
$logDir5 = "C:\Logs\Macos.Services.Deamon"
$logDir6 = "C:\Macos\DMSQueue\Error"
$logDir7 = "C:\Macos\Macos.Shared.Service.Dms"             # neuer Service seit 09.09.25
$logDir8 = "C:\Macos\Logs\WebApiProxy"                     # neuer WebApiProxy seit Oktober 2025      

# Dateipräfixe
$logPrefix1 = "Macos.Services.DmsQueue-Log"
$logPrefix2 = "Macos.Services.Dms-Log"
$logPrefix3 = "Macos.WebPks.UI.WebApi_"
$logPrefix4 = "Macos.Printing.WebApi_"
$logPrefix5 = "Macos.WebPks.Mutation.Deamon_"
$logPrefix7 = "Macos.Shared.Service.Dms-Log"
$logPrefix8 = "Macos.WinPks.WebApi.Client.log"

# Ausgabeziel
$outputPath = "C:\Users\macosService\Desktop\LogSearchTool\resultsLogSearchTool.txt"
