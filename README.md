# Terraform_VMs

Terraform is excellent for the automation of vm creation. We first create a services account to authenticate with google cloud. We retrieve a key in a .json file and input it into the provider.tf file. It is the provider.tf file that plays the key role in google cloud authentication.

Let us go through each file, outlining what each file does.

## Terraform.makefile

This contains commands that allows the host to run shortened version of otherwise long and cumbersome commands. These .makefiles are very useful when desiring quality of life tweaks to your code.

To use the .makefile, execute in the shell:

```make -f Terraform.makefile terraform-apply```

When we look at the .makefile, a make variable defined as ```terraform-apply``` exists. That's why the above command works. It creates the virtual machine.

## default_variables.tf

This file contains our variables. When we look inside the provider.tf or resource.tf files we can see that variables are defined as ```"${var.<my_variable>}"``` This is how Terraform variables work.

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

## resource.tf

This configures our vm to what we specify. Let's take a look at its individual components:

```name``` This assigns a name to our vm.

```machine type``` This sets the type of machine we want e.g. f1-micro.

```zone``` This specifies the zone where our vm will be spun up.

```tags``` Specifies fiewall tags for our vm.

```boot disk``` Specifies which operating system the vm will run on e.g. centos7.

```network interface``` This adds our vm to the default network.

```metadata``` Creates a user on the vm. As we can see, the hosts public key are tranfered to this user, allowing secure shell access.

```connection``` Uses the private key to unencrypt the secure shell transaction, establishing connection.

```provisioner``` This is a critical component of the code. The provisioner allows us to run shell commands on the vm. In this case, we are installing java and wget, installing jenkins with the jenkins_centos7 script, and running a script that touches a file on the system.

## script_1

This script touches a file on the vm.

## terraform.tfstate

Terraform stores information about your infrustructure configurations. It does this through the terraform.tfstate file.

## terraform.tfstate.backup

This provides a backup for your terraform file. If you wish to revert to a previous state, you can do so because of this file.
