Set-ExecutionPolicy RemoteSigned

# Set the path to the input and output files"
$inputFilePath = "C:\Users\Slaviboy\Desktop\EmojisRegex\emoji\15.1\emoji-test.txt"
$outputFilePath = "C:\Users\Slaviboy\Desktop\EmojisRegex\output\15.1\emojis.txt"

# Read the content of the input file
$inputContent = Get-Content -Path $inputFilePath

# Define a function to convert hex values to Unicode escape sequences
function ConvertToUnicode($hexValues) {
    $unicodeArray = $hexValues -split '\s+' | ForEach-Object {
        "\x{$_}"
    }
    ($unicodeArray -join '') + '|'
}

# Process each line and write formatted output to the output file
$outputContent = foreach ($line in $inputContent) {
    if ($line -match '^([0-9A-Fa-f\s]+)\s*;\s*') {
        $hexValues = $matches[1].TrimEnd('  ')
        ConvertToUnicode $hexValues
    }
}

$outputContentNew = $outputContent -join ''

# Save the formatted output to the output file
$outputContentNew | Set-Content -Path $outputFilePath

# Display the formatted output
Write-Output $outputContentNew
