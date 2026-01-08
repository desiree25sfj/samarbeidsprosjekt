resource "hcloud_ssh_key" "member_1_key" {
  name       = "member-1-ssh-key"
  # TODO! Replace this with your own SSH Public key
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQ4V7XaYqLwEydVYkWyYXhMHpqvEj8ifzT8fEgycpCP student-1"
}

resource "hcloud_ssh_key" "member_2_key" {
  name       = "member-2-ssh-key"
  # TODO! Replace this with your own SSH Public key
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECHbdhK3FrUIuL1Pa8zo2OzwB+mvU/Er0K4W3OgbamX student-2"
}

resource "hcloud_server" "server" {
  name        = "example-server"
  server_type = "cax31"
  image       = "debian-13"

  ssh_keys = [
    hcloud_ssh_key.member_1_key.id,
    hcloud_ssh_key.member_2_key.id
  ]
}

output "server_ip" {
  value     = hcloud_server.server.ipv4_address
  sensitive = false
}
