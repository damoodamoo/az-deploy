
variable "environment" {
  description = "Environment name for differentiating deployment environments"
  type        = string

  validation {
    condition     = length(var.environment) <= 12
    error_message = "Must be 12 chars or less"
  }

  validation {
    condition     = can(regex("^[a-z0-9]*$", var.environment))
    error_message = "Cannot contain spaces, uppercase or special characters"
  }
}

variable "suffix" {
  description = "Suffix to append to all resource names"
  type        = string

  validation {
    condition     = length(var.suffix) <= 6
    error_message = "Must be 6 chars or less"
  }

  validation {
    condition     = can(regex("^[a-z0-9]*$", var.suffix))
    error_message = "Cannot contain spaces, uppercase or special characters"
  }
}

variable "location" {
  description = "Azure region to deploy resources to"
  type        = string
  default     = "uksouth"
}