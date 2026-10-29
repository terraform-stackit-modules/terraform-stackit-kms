variable "project_id" {
  description = "STACKIT project ID to which the keys are associated."
  type        = string
}

variable "keyring_id" {
  description = "ID of the keyring the keys belong to."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

variable "keys" {
  description = "Map of KMS keys to create, keyed by a stable identifier (display_name, algorithm, purpose, protection, description?, access_scope?, import_only?)."
  type = map(object({
    display_name = string
    algorithm    = string
    purpose      = string
    protection   = string
    description  = optional(string)
    access_scope = optional(string)
    import_only  = optional(bool)
  }))
  default = {}
}
