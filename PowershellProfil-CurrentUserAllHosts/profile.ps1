function Color-Console{
    $Host.ui.RawUI.BackgroundColor = "White"
    $Host.UI.RawUI.ForegroundColor = "Black"
    $Host.UI.RawUI.WindowTitle = "PowerShell gestartet seit $(Get-Date)"

    if((Get-Command -Name Set-PSReadlineOption).Version.Major -lt 2)
    {
        Set-PSReadlineOption -TokenKind Command -ForegroundColor DarkBlue
        Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Blue
        Set-PSReadlineOption -TokenKind Member -ForegroundColor Black
    }
    else
    {
        Set-PSReadLineOption -Colors @{"Parameter" = [ConsoleColor]::Blue
                               "Command"   = [Consolecolor]::DarkBlue
                               "Number"    = [Consolecolor]::DarkRed
                               "Member"    = [ConsoleColor]::Gray
                               "String"    = [Consolecolor]::DarkGreen
                               "Comment"   = [ConsoleColor]::Green
                               "Keyword"   = [ConsoleColor]::Magenta
                               "None"      = [ConsoleColor]::Black
                               "Operator"  = [ConsoleColor]::DarkMagenta
                               "Type"      = [ConsoleColor]::Cyan
                               "Variable"  = [ConsoleColor]::DarkCyan}
    }
    cls
}
Color-Console
Write-Host "Guten Morgen lieber:$env:USERNAME. Denke daran es wird alles aufgezeichnet was du tust" -ForegroundColor Red
function Prompt
{
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    if($principal.IsInRole($adminRole))
    {
        "PS [Admin] " + (Get-Location) + ">"  
    }
    else
    {
        "PS [User]" + (Get-Location) + ">"
    }
}

function Out-Voice
{
    Param(
            [string]$text
         )

         Add-Type -AssemblyName System.Speech
         $SpeechSynthesizer = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
         $SpeechSynthesizer.Speak($text)
}
Out-Voice -text "Willkommen $($env:USERNAME) $(Get-Random)"