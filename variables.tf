# ─── Core ─────────────────────────────────────────────────────────────────────

variable "project_id" {
  description = "STACKIT project ID to which the keyring, keys and wrapping keys are associated."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

# ─── Keyring ──────────────────────────────────────────────────────────────────

variable "create_keyring" {
  description = "Whether to create the KMS keyring. Set to false to manage keys inside an existing keyring provided via `keyring_id`."
  type        = bool
  default     = true
}

variable "keyring_id" {
  description = "ID of an existing KMS keyring. Used when `create_keyring` is false."
  type        = string
  default     = null
}

variable "keyring_name" {
  description = "Display name of the keyring."
  type        = string
  default     = null
}

variable "keyring_description" {
  description = "Optional user-chosen description to distinguish multiple keyrings."
  type        = string
  default     = null
}

# ─── Keys ─────────────────────────────────────────────────────────────────────

variable "keys" {
  description = <<-EOT
    Map of KMS keys to create, keyed by a stable identifier. Each value:
      - `display_name` : display name to distinguish multiple keys.
      - `algorithm`    : encryption algorithm (`aes_256_gcm`, `rsa_2048_oaep_sha256`, `rsa_3072_oaep_sha256`, `rsa_4096_oaep_sha256`, `rsa_4096_oaep_sha512`, `hmac_sha256`, `hmac_sha384`, `hmac_sha512`, `ecdsa_p256_sha256`, `ecdsa_p384_sha384`, `ecdsa_p521_sha512`).
      - `purpose`      : purpose of the key (`symmetric_encrypt_decrypt`, `asymmetric_encrypt_decrypt`, `message_authentication_code`, `asymmetric_sign_verify`).
      - `protection`   : underlying system protecting the key material (e.g. `software`).
      - `description`  : optional user-chosen description.
      - `access_scope` : optional access scope (`PUBLIC` default, or `SNA`).
      - `import_only`  : optional, whether versions can only be imported.
    NOTE: keys are not destroyed instantly on `terraform destroy` — they are scheduled for deletion (grace period).
  EOT
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

# ─── Wrapping keys ────────────────────────────────────────────────────────────

variable "wrapping_keys" {
  description = <<-EOT
    Map of KMS wrapping keys to create (used to wrap keys for import), keyed by a stable identifier. Each value:
      - `display_name` : display name to distinguish multiple wrapping keys.
      - `algorithm`    : wrapping algorithm (`rsa_2048_oaep_sha256`, `rsa_3072_oaep_sha256`, `rsa_4096_oaep_sha256`, `rsa_4096_oaep_sha512`, `rsa_2048_oaep_sha256_aes_256_key_wrap`, `rsa_3072_oaep_sha256_aes_256_key_wrap`, `rsa_4096_oaep_sha256_aes_256_key_wrap`, `rsa_4096_oaep_sha512_aes_256_key_wrap`).
      - `purpose`      : purpose of the wrapping key (`wrap_symmetric_key`, `wrap_asymmetric_key`).
      - `protection`   : underlying system protecting the key material (e.g. `software`).
      - `description`  : optional user-chosen description.
      - `access_scope` : optional access scope (`PUBLIC` default, or `SNA`).
  EOT
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
