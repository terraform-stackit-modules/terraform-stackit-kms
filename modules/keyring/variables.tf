variable "project_id" {
  description = "STACKIT project ID to which the keyring is associated."
  type        = string
}

variable "create_keyring" {
  description = "Whether to create the KMS keyring."
  type        = bool
  default     = true
}

variable "name" {
  description = "Display name of the keyring."
  type        = string
}

variable "description" {
  description = "Optional user-chosen description to distinguish multiple keyrings."
  type        = string
  default     = null
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}
