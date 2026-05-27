# LogSearchTool

LogSearchTool durchsucht mehrere Windows-Logverzeichnisse in einem definierten Zeitraum und schreibt Treffer gesammelt in eine Ergebnisdatei. Die Logik ist in modulare `logFunctionX.ps1`-Dateien aufgeteilt und wird zentral über `mainLog.ps1` gestartet.

## Projektüberblick

- **Einstiegspunkt:** `mainLog.ps1`
- **Zeitbereich:** `config.ps1` (interaktiv oder per Testparameter)
- **Pfaddefinitionen:** `config.core.ps1` (liest Umgebungsvariablen)
- **Suchlogik:** `functions/common.ps1`
- **Logquellen:** `functions/logFunction1.ps1` bis `functions/logFunction8.ps1`

## Voraussetzungen

- Windows PowerShell
- Zugriff auf die definierten Log-Verzeichnisse
- Schreibrechte für das Ausgabeverzeichnis (`LOG_OUTPUT_PATH`)

## Schnellstart

1. `.env.example` nach `.env` kopieren und Pfade/Präfixe anpassen.
2. Umgebungsvariablen laden (z. B. per `dotenv` oder PowerShell-Profil):

   ```powershell
   Get-Content .env | ForEach-Object {
     if ($_ -match '^(\w+)=(.*)$') { [Environment]::SetEnvironmentVariable($matches[1], $matches[2]) }
   }
   ```

3. Zeitraum in `config.ps1` interaktiv eingeben oder über Parameter setzen.
4. Tool starten:

   ```powershell
   .\mainLog.ps1
   ```

Optional mit Testparametern (kein interaktiver Prompt):

```powershell
.\mainLog.ps1 -TestStartDate "2025-07-25" -TestEndDate "2025-07-29"
```

## Ausgabe

Treffer werden in die Datei geschrieben, die über `LOG_OUTPUT_PATH` definiert ist. Zusätzlich erfolgt eine Konsolenausgabe, die im Debug-Modus (`$debugEnabled = $true`) detaillierter ist.

## Projektstruktur

```text
LogSearchTool/
├── .env.example               # Beispiel für Umgebungsvariablen
├── ChangeLog.md               # Änderungsübersicht
├── README.md                  # Projektbeschreibung
├── config.ps1                 # Zeitbereich (interaktiv oder per Param)
├── config.core.ps1            # Pfade, Präfixe, Debug, Ausgabeziel (ENV)
├── mainLog.ps1                # Einstiegspunkt
└── functions/
    ├── common.ps1             # Zentrale Suchlogik
    ├── logFunction1.ps1
    ├── logFunction2.ps1
    ├── logFunction3.ps1
    ├── logFunction4.ps1
    ├── logFunction5.ps1
    ├── logFunction6.ps1
    ├── logFunction7.ps1
    └── logFunction8.ps1
```
