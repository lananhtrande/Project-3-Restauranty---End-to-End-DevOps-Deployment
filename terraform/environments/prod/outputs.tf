output "acr" {
  value = module.acr.login_server
}

output "gateway_ip" {
  value = module.gateway.public_ip
}