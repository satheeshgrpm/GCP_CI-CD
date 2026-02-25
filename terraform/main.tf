
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc" {
  name = "creativeai-vpc"
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "creativeai-repo"
  format        = "DOCKER"
}

resource "google_container_cluster" "gke" {
  name     = "creativeai-cluster"
  location = var.region
  initial_node_count = 1
}

resource "google_compute_instance_template" "tpl" {
  name_prefix  = "creativeai"
  machine_type = "e2-medium"

  disk { source_image = "debian-cloud/debian-11" boot = true auto_delete = true }

  network_interface { network = google_compute_network.vpc.name access_config {} }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io git
    systemctl enable docker
    systemctl start docker
    mkdir -p /app
  EOF
}

resource "google_compute_instance_from_template" "dev" {
  name = "creativeai-dev-vm"
  source_instance_template = google_compute_instance_template.tpl.id
}

resource "google_compute_instance_from_template" "qa" {
  name = "creativeai-qa-vm"
  source_instance_template = google_compute_instance_template.tpl.id
}

resource "google_compute_instance_from_template" "prod" {
  name = "creativeai-prod-vm"
  source_instance_template = google_compute_instance_template.tpl.id
  machine_type = "e2-standard-2"
}
