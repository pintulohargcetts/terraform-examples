terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.1"
    }
  }
  # default is current directory hence
  #backend "local" {
  #  path ="/tmp/terraform.tfstate"  
  #}
}

# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started
provider "kubernetes" {
  config_path = "~/.kube/config"
  host = "https://kubernetes.docker.internal:6443"
}