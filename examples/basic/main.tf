#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example is self-contained and requires only `project_id`: it creates a
# keyring with one symmetric AES-256-GCM key.
#####################################################################################

module "kms" {
  source = "../.."

  project_id          = var.project_id
  keyring_name        = "example-keyring"
  keyring_description = "Example keyring created by the basic example"

  keys = {
    encryption = {
      display_name = "example-key"
      algorithm    = "aes_256_gcm"
      purpose      = "symmetric_encrypt_decrypt"
      protection   = "software"
    }
  }
}
