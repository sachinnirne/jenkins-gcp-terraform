resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  zone = "asia-southeast1-a"
  machine_type = "n1-standard-1"
  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }
  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20220118"
      size = 35 #in GB
     }
     #This is used for to delete VM and update the parameter
     auto_delete = false
  }

  #This property used for to stop machine and update the paramenter
  allow_stopping_for_update = true
  labels = {
    "env" = "tflearning"
  }

  /*
  scheduling {
    preemptible = true
    automatic_restart = falseß
  }*/

  service_account {
    email = "terraform-gcp@terraform-gcp-339604.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}