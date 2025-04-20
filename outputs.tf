output "blockchain_vm_ip" {
  value = module.vm_blockchain.nat_ip
}

output "monitoring_vm_ip" {
  value = module.vm_monitoring.nat_ip
}
