$uri = "https://api.tinyfox.dev/img?animal=ANIMALHERE"
$destinationFolder = Join-Path -Path $env:USERPROFILE\Pictures -ChildPath "ANIMAL"

# Create the "ANIMAL" folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}
# Ask the user for the number of images to download
$numberOfImages = Read-Host "Enter the number of images you want to download"
#lists
$List1 = @("fox", "yeen", "dook", "woof", "chee", "wah")
$List2 = @("foxes", "yeens", "ferret", "woofs", "cheetahs", "red panda")

# Loop through each item in List1
foreach ($animal in $List1) {
    Write-Host "Currently downloading: $animal"

    # Replace "ANIMALHERE" with the current animal
    $uri = $uri -replace "ANIMALHERE", $animal

    # Replace "ANIMAL" with the corresponding animal in List2
    $destinationFolder = $destinationFolder -replace "ANIMAL", $List2[$List1.IndexOf($animal)]

    # Loop x times
    for ($i = 1; $i -le $numberOfImages; $i++) {
        $timestamp = Get-Date -Format "yyyyMMddHHmmss"
        $destinationPath = Join-Path -Path $destinationFolder -ChildPath "${List2[$List1.IndexOf($animal)]}image_${i}_${timestamp}.jpg"
        # Download the image and save it to the destination path
        Invoke-WebRequest -Uri $uri -OutFile $destinationPath
    }
}
