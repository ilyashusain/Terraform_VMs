# Terraform_VMs

Terraform is excellent for the automation of vm creation. We first create a services account to authenticate with google cloud. We retrieve a key in a .json file and input it into the provider.tf file. It is the provider.tf file that plays the key role in google cloud authentication.

The resource.tf will read in the variables from the variables file. Within this file,. network will set the vm up with the default network. Metadata will create a user that will receive the hosts public key. We then authenticate the user with the ssh connection with the hosts public key.

The provisioner is a key step in the terraform environment. This is what runs commands on the vm, as can be seen in the script.

Let us go through each file, outlining what each file does.

## Terraform.makefile

This contains commands that allows the host to run shortened version of otherwise long and cumbersome commands. These .makefiles are very useful when desiring quality of life tweaks to your code.

To use the .makefile, execute in the shell:

```make -f Terraform.makefile terraform-apply```

When we look at the .makefile, a make variable defined as ```terraform-apply``` exists. That's why the above command works. It creates the virtual machine.

## default_variables.tf

This file contains our variables. When we look at the provider.tf or resource.tf files we can see that variables are defined as "${var.<my_variable>}" This is how Terraform variables work.

## firewall.tf

This contains our firewall rules. Please see the default_variables.tf files to check the value of the inputs.

```name``` This is the name of the network.

```network``` This is the actual network.

```target_tags``` Tags for the network

```source_ranges``` 0.0.0.0/0 i.e. the default.

```allow``` The allowed ports.

## jenkins_centos7

This is a script for installing jenkins on to our vms.

## provider.tf

This is what authenticates terraform with our Google cloud account. Without it, we would not be able to spin up vms. As we can see when we look inside the file, google is our provider, and it connects to our google cloud account since we made a services account with a gcpkey.json, which terraform uses to authenticate with the service.
