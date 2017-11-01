Write-Host "Start"

$url = $env:URL
$cred = $env:USER + ":" + $env:PASS
$enc_cred = [convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($cred))
$webclient = new-object System.Net.WebClient
$webclient.Headers.Add("Authorization","Basic $enc_cred")
$webclient.DownloadFile($url, (join-Path $pwd "master.zip"))

function mkdirp($path){
  If((test-path $path)){
    Remove-Item -path $path -recurse -force  
  }
  New-Item $path -type directory -Force 
}


mkdirp (Join-Path $pwd "unzip")
mkdirp (Join-Path $pwd "src")

$download = (Join-Path $pwd "master.zip")
$dest = (Join-Path $pwd "unzip")
$out = (Join-Path $pwd "src")
function Expand-ZIPFile($file, $destination){
  $shell = new-object -com shell.application
  $zip= $shell.NameSpace($file)
  foreach($item in $zip.items()){
    $shell.Namespace($destination).copyhere($item)
  }
}
Expand-ZipFile $download -destination $dest
$content = Get-ChildItem -Path $dest -Recurse | ?{ $_.PSIsContainer }
foreach ($line in $content){
    if ( [string]::IsNullOrEmpty($line) ) {
        "NULL"
    } else {
       Write-Host "HIT"
       break
    }
}
Expand-ZIPFile (Join-Path $dest $line) -destination $out

Write-Host "Complete"
