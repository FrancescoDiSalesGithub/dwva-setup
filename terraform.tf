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

provisioner "local-exec" {

  command="mkdir dwva"

}

resource "git_clone" "clone" {
  directory      = "./dwva"
  url            = "https://github.com/digininja/DVWA"
  reference_name = "master"
}

resource "docker_compose" "composedvwa" {
  project_name = "composedwva"

  config_paths = [
    "${path.module}/dwva/compose.yml",
  ]
}

provisioner "fix-dwva-to-all-host" {
  command=" sed -i 's|127.0.0.1|0.0.0.0|g' ${path.module}/dwva/compose.yml"
}



