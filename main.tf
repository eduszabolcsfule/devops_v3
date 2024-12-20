terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_network" "network" {
  name    = "panda_network"
  driver  = "bridge"
  internal = false

  ipam_config {
    subnet  = "172.31.0.0/16"
    gateway = "172.31.0.1"
  }
}
