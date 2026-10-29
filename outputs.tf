output "keyring_id" {
  description = "The ID of the KMS keyring (created, or the provided `keyring_id` when `create_keyring` is false)."
  value       = coalesce(module.keyring.keyring_id, var.keyring_id)
}

output "key_ids" {
  description = "Map of key identifier to key ID."
  value       = module.key.key_ids
}

output "wrapping_key_ids" {
  description = "Map of wrapping key identifier to wrapping key ID."
  value       = module.wrapping_key.key_ids
}

output "wrapping_key_public_keys" {
  description = "Map of wrapping key identifier to its public key (used client-side to wrap keys for import)."
  value       = module.wrapping_key.public_keys
}
