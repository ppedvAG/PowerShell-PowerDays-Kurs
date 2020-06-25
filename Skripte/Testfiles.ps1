[cmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem -IsValid })]
    [string]$Path,

    [ValidateRange(3,10)]
    [int]$DirCount = 5,

    [ValidateRange(3,10)]
    [int]$FileCount = 5,

    [ValidateSet("Empty","ipconfig","RandomNr","PowerShellHistory")]
    [string]$FileContent
)



$Ordner = @()
$Ordner += New-Item -Path $Path -ItemType Directory

for($i = 0;$i -lt $DirCount; $i++)
{
    Write-Verbose -Message "Pfad: $Path\Ordner$i "
    Write-Debug -Message "Schleife Ordner"
    $Ordner += New-Item -Path "$Path\Ordner$i" -ItemType Directory
}

foreach($dir in $Ordner)
{
    for($i = 0;$i -lt $DirCount; $i++)
    {
    Write-Debug -Message "schleife Dateien"
    Write-Verbose -Message "$($dir.FullName)\Datei$i.txt"
       #New-Item -Path ($dir.FullName + "\Datei$i.txt") -ItemType File
       New-Item -Path "$($dir.FullName)\Datei$i.txt" -ItemType File
    }
}

