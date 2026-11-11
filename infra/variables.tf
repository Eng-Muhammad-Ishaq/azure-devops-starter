variable "subscription_id" {
  description = "Azure subscription ID. Set via TF_VAR_subscription_id or terraform.tfvars."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region for the resource group."
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "Lowercase project name used in resource names."
  type        = string
  default     = "azdevops"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,15}$", var.project_name))
    error_message = "project_name must be 3-15 characters and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}
