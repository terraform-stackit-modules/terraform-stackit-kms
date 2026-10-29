resource "stackit_kms_wrapping_key" "this" {
  for_each = var.keys

  project_id   = var.project_id
  keyring_id   = var.keyring_id
  display_name = each.value.display_name
  algorithm    = each.value.algorithm
  purpose      = each.value.purpose
  protection   = each.value.protection
  description  = each.value.description
  access_scope = each.value.access_scope
  region       = var.region
}
