for  ($i = 1; $i -le 3; $i++){


$vmname="so"+$i
$VMLocalAdminUser = $env:USERNAME
$VMLocalAdminSecurePassword = ConvertTo-SecureString $cred -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword)
$sshPublicKey= cat $home\.ssh\id_rsa.pub

$vmConfig= New-AzVm `
    -ResourceGroupName "sofia" `
    -Name $vmname `
    -OpenPorts 80,3389,22 `
    -Image UbuntuLTS `
    -Credential $cred



Add-AzVMSshPublicKey -VM $vmConfig  -KeyData $sshPublicKey -Path "/home/$env:username/.ssh/authorized_keys"

 }




