output "key_ids" {
  description = "Map of wrapping key identifier to wrapping key ID."
  value       = { for k, key in stackit_kms_wrapping_key.this : k => key.wrapping_key_id }
}

output "public_keys" {
  description = "Map of wrapping key identifier to its public key."
  value       = { for k, key in stackit_kms_wrapping_key.this : k => key.public_key }
}
