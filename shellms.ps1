# Caminho da chave
$keyPath = "C:\Windows\System32\OpenSSH\revssh_key"

# Detectar pendrive (primeira unidade removível encontrada)
$usb = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 } | Select-Object -First 1

if ($usb) {
    $dest = Join-Path $usb.DeviceID "revssh_key"
    try {
        Copy-Item -Path $keyPath -Destination $dest -Force
        Write-Host "Chave copiada com sucesso para $dest"
    }
    catch {
        Write-Host "Erro ao copiar a chave: $_"
    }
} else {
    Write-Host "Nenhum pendrive encontrado."
}


