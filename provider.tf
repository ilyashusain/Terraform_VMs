provider "google" {
	credentials = "${file("${var.gcpkey}")}"
	project = "${var.project}"
	region = "${var.region}"
}
