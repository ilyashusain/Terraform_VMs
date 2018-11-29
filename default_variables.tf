variable "project" {
	default = "tribal-monolith-219509"
}

variable "region" {
	default = "europe-west2"
}

variable "gcpkey" {
	default = "~/.gcp/terraform_key.json"
}

# resource variables
variable "name" {
	default = "jenkins"
}

variable "machine_type" {
	default = "f1-micro"
}

variable "zone" {
	default = "europe-west2-c"
}

variable "image" {
	default = "centos-7"
}

variable "tags" {
	default = "jenkins"
}

variable "network" {
	default = "default"
}

variable "ssh_user" {
	default = "terraform"
}

variable "public_key" {
	default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
	default = "~/.ssh/id_rsa"
}

variable "allowed_ports" {
	default = ["22"]
}
