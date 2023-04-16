output "vm_disks-vm" {
value =yandex_compute_disk.disk-vm[*].id
description = "vm_disks-vm"
}

resource "local_file" "AnsibleInventory"{
    content = templatefile ("./hosts.tftpl",
    {
        webservers = [
            yandex_compute_instance.example[0],
            yandex_compute_instance.example[1],
            yandex_compute_instance.example2["vm1"],
            yandex_compute_instance.example2["vm2"]
        ]

    })
    filename = "inventory"
}