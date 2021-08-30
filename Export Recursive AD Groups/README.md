# Get-RecursiveNestedGroupInfo.ps1
This script takes a group as input from the command line, and it will loop through the group and output any members (groups/users). If it finds a group it will recursively loop through that group and also auto indent with a "TAB". 

Output is saved in a .txt file and can be imported into Excel as Tab Delimited.

Script Parameters:
Get-RecursiveNestedGroupInfo.ps1 -GroupName "Group Name Here..." -OutputScreen $true

As a visual aid text in yellow is groups, text in green is users.

![image](https://user-images.githubusercontent.com/6281748/131317686-e4e59232-46e6-4be1-b738-bdcc268707bd.png)

