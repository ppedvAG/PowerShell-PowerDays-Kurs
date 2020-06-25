Param(
    [Parameter(Mandatory=$true)]
    $Path,

    $DirCount,

    $FileCount
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

