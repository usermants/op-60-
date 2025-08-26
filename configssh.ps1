# Caminho onde a chave será salva
$KeyPath = "C:\Windows\System32\OpenSSH\revssh_key"

# --- 1. Verificar e instalar OpenSSH Client e Server ---
$Capabilities = Get-WindowsCapability -Online | Where-Object {$_.Name -like "*OpenSSH*"}

foreach ($cap in $Capabilities) {
    if ($cap.State -ne "Installed") {
        Write-Host "Instalando $($cap.Name)..."
        Add-WindowsCapability -Online -Name $cap.Name
    } else {
        Write-Host "$($cap.Name) já instalado."
    }
}

# --- 2. Liberar porta 22 no firewall ---
if (-not(Get-NetFirewallRule -Name "sshd" -ErrorAction SilentlyContinue)) {
    New-NetFirewallRule -Name sshd -DisplayName "OpenSSH Server" -Enabled True `
        -Direction Inbound -Protocol TCP -LocalPort 22 -Action Allow
    Write-Host "Regra de firewall criada para SSH."
} else {
    Write-Host "Regra de firewall SSH já existe."
}

# --- 3. Ativar e iniciar o serviço SSH ---
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service sshd
Write-Host "Serviço SSH iniciado e configurado para iniciar automaticamente."

# --- 4. Gerar par de chaves (se não existir) ---
if (-not(Test-Path "$KeyPath")) {
    ssh-keygen -t ed25519 -f $KeyPath -N ""
    Write-Host "Par de chaves gerado em $KeyPath"
} else {
    Write-Host "Chave já existe em $KeyPath"
}

Write-Host "Configuração SSH concluída com sucesso."
