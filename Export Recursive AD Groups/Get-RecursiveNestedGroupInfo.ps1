param (
 [String] $GroupName,
 [Switch] $OutputScreen = $false
)

If ($OutputScreen){Clear-Host}
$TabLine = $null
$TimeRun = 0
$DateToday = Get-Date
$TimeStamp = Get-Date -Format "yyyyMMdd-HHmm"
$OutputFile = ".\$GroupName-$($TimeStamp).txt"
#$OutputFile = $GroupName + ".txt"

function UnpackNestedGroup($NewNestedGroup)
{  
    If ($TimeRun -gt 0){$TabLine = $TabLine + [char]9}
    $TimeRun = $TimeRun + 1
    $NewNestedResults = Get-ADGroupMember $NewNestedGroup | Sort-Object -Property objectClass -Descending
    foreach ($NewResult in $NewNestedResults)
    {
        If ($NewResult.objectClass -eq "group")
        {
            $ProperManagedBy = Get-ADGroup $NewResult.name -Properties managedBy
            If ($ProperManagedBy.managedBy -eq $null)
            {
                $WhoIsTheManager = "DL Manager Not Set"
            }
            else
            {
                $GetManagerDisplayName = Get-ADUser $ProperManagedBy.managedBy -Properties DisplayName
                $WhoIsTheManager = "DL Managed by " + $GetManagerDisplayName.DisplayName
            }
            If ($OutputScreen){Write-Host -ForegroundColor "Yello" ($TabLine + $NewResult.name + " - (" + $WhoIsTheManager + ")")}
            Add-Content -Path $OutputFile -Value ($TabLine + $NewResult.name + " - (" + $WhoIsTheManager + ")")
            UnpackNestedGroup($NewResult.name)
        }else {
           $ProperDisplayName = Get-ADUser $NewResult.SamAccountName -Properties DisplayName
           If ($OutputScreen){Write-Host -ForegroundColor "Green" ($TabLine + $ProperDisplayName.DisplayName + " - (" + $NewResult.SamAccountName + ")")}
           Add-Content -Path $OutputFile -Value ($TabLine + $ProperDisplayName.DisplayName + " - (" + $NewResult.SamAccountName + ")") 
        } 
     }
}
UnpackNestedGroup($GroupName)
Write-Host -ForegroundColor Cyan "Completed"
