module "vpc" {
  source       = "./modules/vpc"
  network_name = "blockchain-network"
  subnet_name  = "blockchain-subnet"
  region       = var.region
}

module "vm_blockchain" {
  source         = "./modules/vm"
  instance_name  = "blockchain-node"
  machine_type   = "e2-medium"
  image          = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
  disk_size      = 50
  network        = module.vpc.network_name
  subnet         = module.vpc.subnet_name
  zone           = var.zone
  startup_script = file("scripts/startup_blockchain.sh")
}

module "vm_monitoring" {
  source         = "./modules/vm"
  instance_name  = "monitoring-stack"
  machine_type   = "e2-medium"
  image          = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
  disk_size      = 50
  network        = module.vpc.network_name
  subnet         = module.vpc.subnet_name
  zone           = var.zone
  startup_script = file("scripts/startup_monitoring.sh")
}
