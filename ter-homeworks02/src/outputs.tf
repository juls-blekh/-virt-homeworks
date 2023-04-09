output "vm_external_ip_address_web" {
value =yandex_compute_instance.platform.*.network_interface.0.nat_ip_address
description = "vm netology-develop-platform-web external ip"
}

output "vm_external_ip_address_db" {
value =yandex_compute_instance.platform_db.*.network_interface.0.nat_ip_address
description = "vm netology-develop-platform-db external ip"
}
