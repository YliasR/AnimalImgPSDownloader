$uri = "https://api.tinyfox.dev/img?animal=yeen"
$destinationFolder = Join-Path -Path $env:USERPROFILE\Pictures -ChildPath "yeens"

# Create the "yeens" folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Loop 10 times
for ($i = 1; $i -le 10; $i++) {
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath "yeen_image_${i}_${timestamp}.jpg"
    # Download the image and save it to the destination path
    Invoke-WebRequest -Uri $uri -OutFile $destinationPath
}
