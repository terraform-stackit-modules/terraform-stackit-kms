variable "project_id" {
  description = "STACKIT project ID to which the wrapping keys are associated."
  type        = string
}

variable "keyring_id" {
  description = "ID of the keyring the wrapping keys belong to."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

variable "keys" {
  description = "Map of KMS wrapping keys to create, keyed by a stable identifier (display_name, algorithm, purpose, protection, description?, access_scope?)."
  type = map(object({
    display_name = string
    algorithm    = string
    purpose      = string
    protection   = string
    description  = optional(string)
    access_scope = optional(string)
  }))
  default = {}
}
