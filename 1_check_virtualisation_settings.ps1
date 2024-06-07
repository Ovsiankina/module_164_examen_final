# Set-ExecutionPolicy Unrestricted -Scope CurrentUser

# Get virtualisation info
$virtualizationStatus = Get-WmiObject -Namespace "root\CIMV2" -Query "SELECT * FROM Win32_Processor" | Select-Object -ExpandProperty VirtualizationFirmwareEnabled

# Check if virtualisation is enabled in the BIOS
if ($virtualizationStatus -eq $false) {
    Write-Host "La virtualistion n'est pas activée sur votre PC M. Maccaud.. Comment puis-je travailler dans ces conditions !?!?!" -ForegroundColor Red
    Write-Host "Il vous faudra activer la virtualisation dans le BIOS de votre PC" -ForegroundColor blue
    Read-Host "Pressez sur un bouton pour terminer le script ..."
    exit

} elseif ($virtualizationStatus -eq $true) {
    Write-Host "La virtualisation activée ..." -ForegroundColor Green
    # Check if script is running with admin role
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Host "Veuillez executer ce script en mode ADMINISTRATEUR" -ForegroundColor Red
        Read-Host "Pressez sur un bouton pour terminer le script ..."
        exit
    }
    Write-Host "Le script tourne en mode admin ..." -ForegroundColor Green

    # Function to check if a feature is enabled
    # Having a function here is dirty but.. I'm lazy
    function Is-FeatureEnabled($featureName) {
        $feature = Get-WindowsOptionalFeature -Online -FeatureName $featureName
        return $feature.State -eq "Enabled"
    }

    # Check and enable WSL feature
    $wslFeatureName = Is-FeatureEnabled Microsoft-Windows-Subsystem-Linux
    if ($wslFeatureName) {
        Write-Host "Linux Subsystem feature is already enabled."
    } else {
        Write-Host "Enabling WSL feature..."
        dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    }

    # Check and enable Virtual Machine Platform feature
    $vmFeatureName = Is-FeatureEnabled VirtualMachinePlatform
    if ($vmFeatureName) {
        Write-Host "Virtual Machine Platform feature is already enabled."
    } else {
        Write-Host "Enabling Virtual Machine Platform feature..."
        dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    }

    # Restart to apply changes if any feature was not previously enabled
    if (!($wslFeatureName) -or !($vmFeatureName)) {
        # Ask the user if they want to restart now or later

        Write-Host "Le PC doit être redémarré pour activer correctement Linux Subsystem et Virtual Machine Platform feature" -ForegroundColor Red
        $restartChoice = Read-Host "Voulez vous redémarrer le PC MAINTENANT? (yes/no)"

        if ($restartChoice -eq "yes") {
            Write-Host "CTRL + C pour annuler !" -ForegroundColor Red
            Write-Host "Restarting the computer to apply changes in 5 sec..."
            Start-Sleep -Seconds 5.0
            Restart-Computer -Force
        } else {
            Write-Host "Veuillez redémarrer votre PC plus tard puis relancez le script."
            exit
        }
    }
    
    try {
        # Set WSL 2 as the default version
        Write-Host "WSL 2 par défaut"
        wsl --set-default-version 2

        # Run the WSL -l command and store the output
        $wslListOutput = wsl -l
        wsl --install -d Ubuntu

    } catch {
        Write-Host "An error occurred." -ForegroundColor Red
        Read-Host "Press Enter to exit"
    }

} else {
    Write-Host "c tt cassé :(" -ForegroundColor Red
}
