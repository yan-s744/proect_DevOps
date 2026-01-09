 resource "yandex_compute_instance" "virtual_machine" {
  for_each        = var.virtual_machines
  name = each.value["vm_name"]

  resources {
    cores  = each.value["vm_cpu"]
    memory = each.value["ram"]
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk[each.key].id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
}
