# PowerShell
Public PowerShell Script Gallery for some of my favorite scripts that helped solve some of the most repetitive, mundane and utmost boring of tasks.

# Get-RecursiveNestedGroupInfo.ps1
This script takes a group as input from the command line and it will loop through the group and output any memebers (groups/users). If it findes a group it will recursivley loopp through that group and also auto indent with a "TAB". 

Output is saved in a .txt file and can be imported into Excel as Tab Delimited.

Script Parameters:
Get-RecursiveNestedGroupInfo.ps1 -GroupName "Grou Name Here..." -OutputScreen $true
