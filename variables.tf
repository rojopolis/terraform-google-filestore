variable "instance_id" {
    description = "The ID of the instance or a fully qualified identifier for the instance."
    type        = "string"
}

variable "project" {
    description = "GCP Project Id to host the filestore instance."
}

variable "location" {
    description = "The location (zone) of the instance."
    type        = "string"
    default     = ""
}

variable "file_share" {
    description = <<EOF
        capacity
            The desired size of the volume. The capacity must be a whole number
            followed by a size unit such as TB for terabyte. If no size unit is
            specified, GB is assumed. The minimum size for a standard instance
            is 1TB. The minimum size for a premium instance is 2.5TB.
         name
            The desired logical name of the volume.
    EOF
    type        = "map"
}

variable "network" {
    description = <<EOF
        name
            The name of the Google Compute Engine VPC network to which the
            instance is connected.

         reserved_ip_range
            A /29 CIDR block in one of the [internal IP address
            ranges(https://www.arin.net/knowledge/address_filters.html) that
            identifies the range of IP addresses reserved for this instance.
            For example, 10.0.0.0/29 or 192.168.0.0/29. The range you specify
            can't overlap with either existing subnets or assigned IP address
            ranges for other Cloud Filestore instances in the selected VPC
            network.
    EOF
    type        = "map"
}

variable "description" {
    description = "A description of the Cloud Filestore instance."
    type        = "string"
    default     = ""
}

variable "labels" {
    description = "List of labels to add."
    type        = "map"
    default = {}
}

variable "tier" {
    description = <<EOF
        The service tier for the Cloud Filestore instance. TIER must be one of:
        premium
            Premium Filestore instance.
         standard
            Standard Filestore instance.
    EOF
    type = "string"
    default = "standard"
}