provider "google" {}
data "google_client_config" "current" {}
module "filestore" {
    source = "../"
    instance_id = "testing"
    project = "${data.google_client_config.current.project}"
    location = "us-west1-b"
    file_share = {
        capacity = "1TB"
        name     = "testing1"
    }
    network = {
        name = "default"
        reserved_ip_range = "10.217.22.0/29"
    }
    description = "A test instance"
    labels = {
        foo = "bar"
        baz = "biz"
    }
}