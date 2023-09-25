#TODO Create an Azure Resource using scripts in Azure PowerShell 
# ========================================================================================================================

# 1. Use the New-AzVm cmdlet to create a VM.

New-AzVm 
    -ResourceGroupName learn-2827bde1-dfd2-4c89-a75f-969394dfb295 
    -Name "testvm-eus-01"
    -Credential (Get-Credential) 
    -Location "eastus"
    -Image Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest 
    -OpenPorts 22
    -PublicIpAddressName "testvm-eus-01"

# 2. Create a username and password, then press Enter. PowerShell starts creating your VM.

# 3. The VM creation takes a few minutes to complete. When it's done, you can query it and assign the VM object to a variable ($vm).

$vm = (Get-AzVM -Name "testvm-eus-01" -ResourceGroupName learn-2827bde1-dfd2-4c89-a75f-969394dfb295)

# 4. Query the value to dump out the information about the VM.

$vm

# 5. You can reach into complex objects through a dot (.) notation. For example, to see the properties in the VMSize object associated with the HardwareProfile section, run the following command:

$vm.HardwareProfile

# 6. Or, to get information on one of the disks, run the following command:

$vm.StorageProfile.OsDisk

# 7. You can even pass the VM object into other cmdlets. For example, running the following command shows you all available sizes for your VM:

$vm | Get-AzVMSize

# 8. Now, run the following command to get your public IP address:

Get-AzPublicIpAddress -ResourceGroupName learn-2827bde1-dfd2-4c89-a75f-969394dfb295 -Name "testvm-eus-01"

# 9. With the IP address, you can connect to the VM with SSH. For example, if you used the username bob, and the IP address is 205.22.16.5, running this command would connect to the Linux machine:

ssh bobbyabuchi@52.142.8.185

#TODO Delete a VM

# To try out some more commands, let's delete the VM. First, we need to shut it down (enter Y if prompted to continue):

Stop-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName

# When the VM has stopped, delete the VM by running the Remove-AzVM cmdlet (enter Y if prompted to continue):

Remove-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName

# Run this command to list all the resources in your resource group:

Get-AzResource -ResourceGroupName $vm.ResourceGroupName | Format-Table

# The Remove-AzVM command just deletes the VM. It doesn't clean up any of the other resources. At this point, we'd likely just delete the resource group itself and be done with it. However, let's run through the exercise to clean it up manually. You should see a pattern in the commands.

# 1. Delete the network interface:

$vm | Remove-AzNetworkInterface –Force

# 2. Delete the managed OS disks:

Get-AzDisk -ResourceGroupName $vm.ResourceGroupName -DiskName $vm.StorageProfile.OSDisk.Name | Remove-AzDisk -Force

# 3. Next, delete the virtual network:

Get-AzVirtualNetwork -ResourceGroupName $vm.ResourceGroupName | Remove-AzVirtualNetwork -Force

# 4. Delete the network security group:

Get-AzNetworkSecurityGroup -ResourceGroupName $vm.ResourceGroupName | Remove-AzNetworkSecurityGroup -Force

# 5. Finally, delete the public IP address:

Get-AzPublicIpAddress -ResourceGroupName $vm.ResourceGroupName | Remove-AzPublicIpAddress -Force

#TODO Azure PowerShell Scripting 
# ===================================================================================================================

.\myScript.ps1


#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================

#TODO title
# =====================================================================================================================


