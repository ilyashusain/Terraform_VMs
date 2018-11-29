# Terraform_VMs

Terraform is excellent for the automation of vm creation. We first create a services account to authenticate with google cloud. We retrieve a key in a .json file and input it into the provider.tf file. It is the provider.tf file that plays the key role in google cloud authentication.

The resource.tf will read in the variables from the variables file. Within this file,. network will set the vm up with the default network. Metadata will create a user that will receive the hosts public key. We then authenticate the user with the ssh connection with the hosts public key.

The provisioner is a key step in the terraform environment. This is what runs commands on the vm, as can be seen in the script.
