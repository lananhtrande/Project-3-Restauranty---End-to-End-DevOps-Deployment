terraform {
  required_version = ">=1.8"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
    }

  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}