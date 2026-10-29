resource "stackit_kms_keyring" "this" {
  count = var.create_keyring ? 1 : 0

  project_id   = var.project_id
  display_name = var.name
  description  = var.description
  region       = var.region
}
