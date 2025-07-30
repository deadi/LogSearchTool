# LogSearchTool
Powershell Tool to search Logfiles
```
LogSearchTool/
├── mainLog.ps1               # Einstiegspunkt
├── config.ps1                # Zentrale Konfiguration (Datum, Verzeichnisse, Pfade)
├── README.md                 # Diese Projektbeschreibung

├── functions/
│   ├── common.ps1            # Zentrale Logik: Search-Log
│   ├── logFunction1.ps1      # Logsuche DmsQueue
│   ├── logFunction2.ps1      # Logsuche Services.Dms
│   ├── logFunction3.ps1      # Logsuche WebPks.UI.WebApi
│   ├── logFunction4.ps1      # Logsuche Printing.WebApi
│   ├── logFunction5.ps1      # Logsuche Mutation.Deamon
│   └── logFunction6.ps1      # Prüfung .pdf.dmsqueue Fehlerdateien

└── resultsLogSearchTool.txt  # Ausgabeprotokoll (wird bei Ausführung erstellt/überschrieben)
```
