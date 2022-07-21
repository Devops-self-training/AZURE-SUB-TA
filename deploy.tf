#  Replace these value to your own value
locals {
  tenant_id         = ""
  subscription_name = ""
  subscription_id   = ""
  location          = "southeastasia"
}

module "terraform-generate-ssh-key" {
  source = "git::https://github.com/aq-terraform-modules/generate-ssh-key.git?ref=v1.0"
}

module "terraform-azure-postgresql-aks" {
  source = "git::https://github.com/aq-terraform-modules/postgresql-aks.git?ref=v1.0"

  resource_group_name = "${local.subscription_name}-aks"
  location            = local.location
  aks_name            = "test-aks"
  kubernetes_version  = "1.19.9"

  # Linux profile
  public_ssh_key = module.terraform-generate-ssh-key.public_ssh_key

  # Nodepool section
  node_auto_scale = true
  node_min_count  = 3
  node_max_count  = 5
  node_public_ip  = true

  # Tag section
  tag_env = "Development"
}
