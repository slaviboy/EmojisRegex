Set-ExecutionPolicy RemoteSigned

# Set the path to the input and output files"
$inputFilePath = "C:\Users\Slaviboy\Desktop\EmojisRegex\emoji\15.1\emoji-test.txt"
$outputFilePath = "C:\Users\Slaviboy\Desktop\EmojisRegex\output\15.1\emojis.txt"


# Read the content of the input file
$inputContent = Get-Content -Path $inputFilePath

# Initialize an empty array to store the extracted values
$outputValues = @()

# Loop through each line in the input content
foreach ($line in $inputContent) {
    # Check if the line contains the specified pattern
    if ($line -match ';.*?#.*?E') {
        # Extract the characters between '#' and 'E'
        $match = $matches[0] -replace ';.*?#(.*?)E.*', '$1'

        # Add the extracted value to the output array
        $outputValues += $match
    }
}

# Convert the array to a string using '|' as a separator
$outputString = $outputValues -join '|'


# Save the formatted output to the output file
$outputString | Set-Content -Path $outputFilePath

# Output the final result
Write-Output $outputString
