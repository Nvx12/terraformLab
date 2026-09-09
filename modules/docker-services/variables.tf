variable "environment" {
  description = "Environment name"
  type        = string
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
    persistent    = optional(bool, false)
    mount_path    = optional(string, null)
  }))
}