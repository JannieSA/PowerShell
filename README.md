# PowerShell
Public PowerShell Script Gallery for some of my favorite scripts that helped solve some of the most repetitive, mundane, and utmost boring of tasks.

# Export Recursive AD Groups
This script takes a group as input from the command line, and it will loop through the group and output any members (groups/users). If it finds a group it will recursively loop through that group and also auto indent with a "TAB". 

Output is saved in a .txt file and can be imported into Excel as Tab Delimited.

Script Parameters:
Get-RecursiveNestedGroupInfo.ps1 -GroupName "Grou Name Here..." -OutputScreen $true

As a visual aid text in yellow is groups, text in green is users.
