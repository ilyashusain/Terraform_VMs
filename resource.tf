resource "google_compute_instance" "default" {
	name = "${var.name}-${count.index+1}"
	machine_type = "${var.machine_type}"
	zone = "europe-west2-c"
	tags = ["jenkins"]
	count = 1
	boot_disk {
		initialize_params {
			image = "${var.image}"
		}
	}
	network_interface {
		network = "${var.network}"
		access_config {
			// Ephemeral IP
		}
	}
	metadata {
    	sshKeys = "${var.ssh_user}:${file("~/.ssh/id_rsa.pub")}"
  }	
	connection = {
		type = "ssh"
		user = "terraform"
		private_key = "${file("~/.ssh/id_rsa")}"
	}
	provisioner "remote-exec" {
		inline = [
			"sudo yum install -y java wget"
		]
	}
	provisioner "remote-exec" {
		script = "jenkins_centos7"
	}
	provisioner "remote-exec" {
		script = "script_1"
	}
}
