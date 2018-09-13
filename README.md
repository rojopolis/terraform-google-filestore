# terraform-google-filestore

A module to manage Google Cloud Filestore instances

```
provider "google" {}
data "google_client_config" "current" {}

module "filestore" {
    source  = "rojopolis/filestore/google""
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

output "filestore_ip" {
    value = "${module.filestore.filestore_ip}"
}
```

## External dependencies

* [jq](https://stedolan.github.io/jq/)
* [Google Cloud SDK](https://cloud.google.com/sdk/)