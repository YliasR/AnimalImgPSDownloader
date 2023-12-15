$uri = "https://api.tinyfox.dev/img?animal=fox"
$destinationFolder = Join-Path -Path $env:USERPROFILE\Pictures -ChildPath "foxes"

# Create the "foxes" folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Ask the user for the number of images to download
$numberOfImages = Read-Host "Enter the number of images you want to download"

# Loop based on the user input
for ($i = 1; $i -le $numberOfImages; $i++) {
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath "fox_image_${i}_${timestamp}.jpg"
    # Download the image and save it to the destination path
    Invoke-WebRequest -Uri $uri -OutFile $destinationPath
}
