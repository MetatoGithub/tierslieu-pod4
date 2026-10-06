$ErrorActionPreference = 'SilentlyContinue'

Write-Output "##################################"
if ($PSVersionTable.PSVersion.Major -eq 7) {Write-Output "#      User creation script      #"} else {Write-Output "#  PLEASE RUN WITH POWERSHELL 7  #" | Exit}
Write-Output "##################################"

$userPasswords = (Read-Host -AsSecureString 'Enter password for every user:')
$csvfilepath = (Read-Host 'Insert path to CSV (Format: Username;Group;OUDC)')

$UsersList = Import-Csv -Path "C:\Users\Administrateur\Desktop\addusers.csv" -Delimiter ';'

Write-Output "########## CSV IMPORTED ##########"
Write-Output " "
Write-Output "##################################"
Write-Output "#          Adding users          #"
Write-Output "##################################"
Write-Output " "

$UsersList | foreach {
    $csvusername=$_.Username
    Write-Output "##### Handling user $csvusername #####"
    $csvusergroup=$_.Group
    $csvOUDC=$_.'OUDC'
    new-aduser -name $csvusername -AccountPassword $userPasswords -Enabled $true -Path $csvOUDC && Write-Output "Added user $csvusername" || Write-Output "User $csvusername already exists, skipping..."
    New-ADGroup -Name $csvusergroup -GroupScope 'Global' -Path $csvOUDC && Write-Output "Added group $csvusergroup" || Write-Output "Group $csvusergroup already exists, skipping..."
    Add-ADGroupMember -Identity $csvusergroup -Members $csvusername && Write-Output "Added user $csvusername to group $csvusergroup"
    Write-Output " "
    #Write-Output "user $csvusername in group $csvusergroup at path ou $csvOUDC"
}