terraform {
  required_providers {
    git = {
      source  = "metio/git"
      version = "2026.8.21"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "4.5.0"
    }

  }
}

provider "git" {
  # Configuration options
}

provider "docker" {

}



resource "git_clone" "clone" {
  directory      = "./dwva"
  url            = "https://github.com/digininja/DVWA"
  reference_name = "master"

  provisioner "local-exec" {
    command = "sed -i 's|127.0.0.1|0.0.0.0|g' ${path.module}/dwva/compose.yml"
  }

}

resource "docker_compose" "composedvwa" {
  project_name = "composedwva"

  config_paths = [
    "${path.module}/dwva/compose.yml",
  ]
}

