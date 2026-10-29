output "keyring_id" {
  description = "The ID of the keyring (null when `create_keyring` is false)."
  value       = var.create_keyring ? stackit_kms_keyring.this[0].keyring_id : null
}
