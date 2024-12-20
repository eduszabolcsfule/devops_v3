terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "panda_app" {
  name = "panda_app:latest"

  build {
    context    = "."
    dockerfile = "Dockerfile_app"
    tag        = ["panda_app:latest"]
    no_cache   = true
  }
}

resource "docker_container" "panda_app" {
  name  = "panda_app"
  image = docker_image.panda_app.image_id

  ports {
    internal = 8501
    external = 8501
  }

  networks_advanced {
    name          = docker_network.network.name
    ipv4_address  = "172.31.0.2"
  }
}
