data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_compute_image
}
resource "yandex_compute_instance" "platform_db" {
#  name        = var.vm_db_name
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vm_db_resources.cores
    memory        = var.vm_db_resources.memory
    core_fraction = var.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    serial-port-enable = var.vm_metadata.serial-port-enable
    ssh-keys = var.vm_metadata.ssh-keys 
  }

}
