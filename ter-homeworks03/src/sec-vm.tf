#создаем 3 HDD
resource "yandex_compute_disk" "disk-vm" {
  
  count=3

  name     = "disk-${count.index}"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = 1 
}

#создаем  ВМ
resource "yandex_compute_instance" "security-vm" {
  name        = "netology-develop-platform-web-security"
  platform_id = "standard-v1"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }   
  }

  dynamic secondary_disk { 
   for_each = [for s in var.disks-sec: {
    disk_id = yandex_compute_disk.disk-vm[s.number].id
   }]
   # for_each = yandex_compute_disk.disk-vm[*].id
    content {
    #  disk_id = "${each.value}"
       disk_id = secondary_disk.value.disk_id
    } 
 }
 
  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  allow_stopping_for_update = true
}

variable "disks-sec" {
  default = [
    {number = 0
    disk_id = ""},
    {number = 1
    disk_id = ""},
    {number = 2
    disk_id = ""}
  ]
}