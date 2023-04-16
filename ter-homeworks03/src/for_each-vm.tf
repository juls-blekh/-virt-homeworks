#создаем 2 ВМ (different)
resource "yandex_compute_instance" "example2" {

  depends_on =   [yandex_compute_instance.example]

  for_each = var.vm_resources

  name        = "netology-develop-platform-web-${each.value.vm_name}"
  platform_id = "standard-v1"
  
  resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.disk
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }   
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    ssh-keys           = "ubuntu:${local.ssh-public}"
  }
  allow_stopping_for_update = true
}

variable "vm_resources"{
    description = "Map of variables to define VM resourses"
    type = map (object({
        vm_name = string,
        cpu = number,
        ram = number,
        disk = number})) 
    default = {
      "vm1" = {
        vm_name = "vm1"
        cpu  = 2
        ram = 1
        disk = 20
      },
     "vm2" = {
        vm_name = "vm2"
        cpu  = 4
        ram = 2
        disk = 5
      }   
    }
    
}
locals{
    ssh-public=file("~/.ssh/id_ed25519.pub")
}