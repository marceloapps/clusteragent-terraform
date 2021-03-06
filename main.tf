##################################################################################
# PROVIDERS
##################################################################################
terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    kustomization = {
      source  = "kbst/kustomization"
      version = "0.7.0"
    }      
 }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}