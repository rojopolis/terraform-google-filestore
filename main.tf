locals {
    instance_id = "${var.instance_id}"
    project     = "${var.project}"
    location    = "${var.location}"
    tier        = "${var.tier}"
    description = "${var.description}"
    network     = "${format("--network=name='%s',reserved-ip-range=%s", var.network["name"], var.network["reserved_ip_range"])}"
    file_share = "${format("--file-share=name='%s',capacity=%s", var.file_share["name"], var.file_share["capacity"])}"
    create_command = <<EOF
        gcloud beta filestore instances create \
        ${local.instance_id} \
        --project=${local.project} \
        --location=${local.location} \
        --tier=${local.tier} \
        --description='${local.description}' \
        ${local.network} \
        ${local.file_share}
    EOF
    destroy_command = <<EOF
        gcloud beta filestore instances delete \
        ${local.instance_id} \
        --project=${local.project} \
        --location=${local.location}
    EOF
}

resource "null_resource" "google_filestore_instance" {
  provisioner "local-exec" {
    command = "${local.create_command}"
  }

  provisioner "local-exec" {
      when = "destroy"
      command = "${local.destroy_command}"
  }
}

data "external" "filestore_ip" {
    depends_on = ["null_resource.google_filestore_instance"]
    program = [
        "bash",
        "${path.module}/scripts/get_filestore_ip.sh",
        "${local.instance_id}",
        "${local.project}",
        "${local.location}",
    ]
}