module "keyring" {
  source = "./modules/keyring"

  create_keyring = var.create_keyring
  project_id     = var.project_id
  name           = var.keyring_name
  description    = var.keyring_description
  region         = var.region
}

module "key" {
  source = "./modules/key"

  project_id = var.project_id
  keyring_id = coalesce(module.keyring.keyring_id, var.keyring_id)
  region     = var.region
  keys       = var.keys
}

module "wrapping_key" {
  source = "./modules/wrapping-key"

  project_id = var.project_id
  keyring_id = coalesce(module.keyring.keyring_id, var.keyring_id)
  region     = var.region
  keys       = var.wrapping_keys
}
