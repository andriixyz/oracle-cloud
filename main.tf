provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Cloud Guard Workload Protection"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = var.availability_domain
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa6gy7hid54oivgun774qsav6qkk7dklyz6u6zikh3l2yfcvlxlosa"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "${oci_core_subnet.generated_oci_core_subnet.id}"
	}
	display_name = "instance-20250802-1036"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCAi2X8atFuWpRTMwKI1pHLVdKut4hHj6U+jlk4dqAUzmcSHRxMPSOTZ9oJ2k/Cakkd4B/vRYiWk3vOYAPnPbEdPwqseSX1rqvcWuOdQyyxLcrR6OBKua54KYVMgY4l8cu0h8Fnkwl5T4wQy/ZRWbK0ZTYMjmwn0mkhFN7WzcqK964i+ZvLwEO1QPyUw4GryTWbzJJULyqwQN7WodYCVCt6Zi2eBp7ZPaAxQpQHbyJvBcnH0NQD54WNw1hQpEqFuy79W/bSKDzBQxJM/35mdjoxKa2RzP2uKX7Q153fVafkC0EjZgkXxnH87oIZSv45lW5Gt3PiANqjZs0db9sdMhX ssh-key-2025-08-02"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		source_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaww5bbjvzql4bvtt3nrok7v2k6atg55ldvgffg36jqdd4wc7ecssa"
		source_type = "image"
	}
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_block = "10.0.0.0/16"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa6gy7hid54oivgun774qsav6qkk7dklyz6u6zikh3l2yfcvlxlosa"
	display_name = "vcn-20250802-1039"
	dns_label = "vcn08021051"
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
	cidr_block = "10.0.0.0/24"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa6gy7hid54oivgun774qsav6qkk7dklyz6u6zikh3l2yfcvlxlosa"
	display_name = "subnet-20250802-1039"
	dns_label = "subnet08021051"
	route_table_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaa6gy7hid54oivgun774qsav6qkk7dklyz6u6zikh3l2yfcvlxlosa"
	display_name = "Internet Gateway vcn-20250802-1039"
	enabled = "true"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
	route_rules {
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		network_entity_id = "${oci_core_internet_gateway.generated_oci_core_internet_gateway.id}"
	}
	manage_default_resource_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
}

variable "availability_domain" {
  description = "The availability domain to use"
  type        = string
}

