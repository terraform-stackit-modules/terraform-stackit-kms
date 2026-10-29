output "keyring_id" {
  description = "The keyring ID created by the example."
  value       = module.kms.keyring_id
}

output "key_ids" {
  description = "The key IDs created by the example."
  value       = module.kms.key_ids
}
