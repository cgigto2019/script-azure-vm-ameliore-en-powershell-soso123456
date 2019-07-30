for  ($i = 1; $i -le 3; $i++){


$vmname="shina"+$i
$VMLocalAdminUser = $env:USERNAME
$VMLocalAdminSecurePassword = ConvertTo-SecureString $cred -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword)
$sshPublicKey= cat C:\Users\utilisateur\.ssh\id_rsa.pub

$vmConfig= New-AzVm `
    -ResourceGroupName "shina" `
    -Name "hello" `
    -OpenPorts 80,3389,22 `
    -Image UbuntuLTS `
    -Credential $cred



Add-AzVMSshPublicKey -VM $vmConfig  -KeyData $sshPublicKey -Path "/home/utilisateur/.ssh/authorized_keys"

 }




