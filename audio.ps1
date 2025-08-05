$w = "$env:TEMP\msg.wav"
Invoke-WebRequest -Uri "https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav" -OutFile $w
(New-Object Media.SoundPlayer $w).Play()
