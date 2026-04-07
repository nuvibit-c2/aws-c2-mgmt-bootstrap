# ---------------------------------------------------------------------------------------------------------------------
# ¦ DO NOT MODIFY
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  backend "local" {
    # NOTE: This state file is only needed during the bootstrap process and can be deleted afterwards
    path = "bootstrap.tfstate"
  }
}
