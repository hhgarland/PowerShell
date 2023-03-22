# Set the parent directory path
$parentDir = "C:\Path\To\Some\Backup\2022\"

# Set the regular expression pattern to match against the file names, i.e. 20220427-cdr_StandAloneCluster_08_202204270500_1833910
$regexPattern = "^([0-9]+-)(.*)$"

# Get a list of subdirectories within the parent directory 
$subDirs = Get-ChildItem -Path $parentDir -Directory

# Loop through each subdirectory
foreach ($subDir in $subDirs) {
    # Get a list of files in the subdirectory that match the regular expression pattern
    $filesToRename = Get-ChildItem -Path $subDir.FullName | Where-Object { $_.Name -match $regexPattern }

    # Loop through each file and rename it
    foreach ($file in $filesToRename) {
        # Get the new file name by replacing the matched regular expression pattern with a new string
        $newFileName = $file.Name -replace $regexPattern, '$2'

        # Rename the file
        Rename-Item $file.FullName $newFileName
    }
}
