variable "environment" {
  description = "Environment name"
  type        = string

  validation {
    condition = var.environment == "staging"

    error_message = "This configuration is only for the staging environment."
  }
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "services" {
  description = "Docker services"

  type = map(object({
    image         = string
    internal_port = number
    external_port = number
    environment   = optional(list(string), [])
  }))
}