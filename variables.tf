variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition = contains(
      ["dev", "staging", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "services" {
  description = "Services to deploy"

  type = map(object({
    image         = string
    internal_port = number
    external_port = number
    environment   = optional(list(string), [])
  }))
}