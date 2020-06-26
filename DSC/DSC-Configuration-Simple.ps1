configuration WebServerConfiguration
{
    # Zum Abrufen der Knotenliste können Ausdrücke ausgewertet werden.
    # Beispiel: $AllNodes.Where("Role -eq Web").NodeName
    node ("DC1","Member1")
    {
        # Ressourcenanbieter aufrufen
        # Beispiel: WindowsFeature, File
        WindowsFeature WebServer
        {
           Ensure = "Present"
           Name   = "Web-Server"
        }
        WindowsFeature ManagementTools
        {
            Ensure = "Present"
            Name = "Web-Mgmt-Tools"
            DependsOn = "[WindowsFeature]WebServer"
        }
        WindowsFeature DefaultDoc
        {
            Ensure = "Present"
            Name = "Web-Default-Doc"
        }

        LocalConfigurationManager
        {
            ConfigurationMode = "ApplyAndAutoCorrect"
        }
             
    }
}