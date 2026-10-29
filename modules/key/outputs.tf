output "key_ids" {
  description = "Map of key identifier to key ID."
  value       = { for k, key in stackit_kms_key.this : k => key.key_id }
}
