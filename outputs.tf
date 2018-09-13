output "filestore_ip" {
    description = "IP address of the Cloud Filestore instance."
    value = "${data.external.filestore_ip.result["ipAddress"]}"
}