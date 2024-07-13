# Specify the source and destination paths
$sourcePath = "C:\Users\User\AppData\Roaming\Mozilla\Firefox\Profiles\fvq3m97e.default-release"
$destinationPath = "E:\ff_profile\"

# List of files and folder https://support.mozilla.org/bm/questions/1313272
# File names to copy
$fileNames = @(
    "places.sqlite",
    "favicons.sqlite",
    "formhistory.sqlite",
    "logins.json",
    "key4.db",
    "cert9.db",
    "permissions.sqlite",
    "sessionstore.jsonlz4"
)
# Folders list to copy
$folderNames = @(
	"bookmarkbackups"
)

function Copy-Firefox-Files-Folders ([string]$source, [string]$destination) {
    # Validate source and destination paths
    if (-not (Test-Path -Path $source -PathType Container)) {
		Write-Host $source
        Write-Host "Source directory not found."
        return
    }

    if (-not (Test-Path -Path $destination -PathType Container)) {
        Write-Host "Destination directory not found."
        return
    }

	try {
		# Copy each file
		foreach ($file in $fileNames) {
			$sourceFile = Join-Path -Path $source -ChildPath $file
			$destinationFile = Join-Path -Path $destination -ChildPath $file
			Copy-Item -Path $sourceFile -Destination $destinationFile -ErrorAction stop
		}
	
		# Copy each folder
		foreach ($folder in $folderNames) {		
			$sourceFolder = Join-Path -Path $source -ChildPath $folder
			Copy-Item -Path $sourceFolder -Destination $destination -Recurse -ErrorAction stop
		}
	}
	catch {
		$exception = $_
		Write-Host $exception
	}
	
	if ([string]::IsNullOrEmpty($exception)) {
		# Print "Done" if successful
		Write-Host "Done"
	}
}

# copy 
Copy-Firefox-Files-Folders $sourcePath $destinationPath
#Write-Host $sourcePath
