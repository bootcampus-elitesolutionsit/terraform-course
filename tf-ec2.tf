resource "aws_instance" "demo_server" {
  ami                    = coalesce(data.aws_ami.ubuntu.id, var.ami)
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnet_id[0]
  vpc_security_group_ids = [module.vpc.security_group_id]
  key_name               = aws_key_pair.ssh_key.key_name
  #   user_data_base64       = data.cloudinit_config.php.rendered
  tags = merge({ Name = "php-demoapp", Env = "dev" }, var.tags, local.application_tags)

  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     private_key = file(var.key)
  #     host        = coalesce(self.public_ip, self.private_ip)
  #     timeout     = "60s"
  #   }

  #   provisioner "file" {
  #     source      = "scripts/script.sh"
  #     destination = "/tmp/script.sh"
  #   }

  #   provisioner "remote-exec" {
  #     inline = [
  #       "chmod +x /tmp/script.sh",
  #       "sudo /tmp/script.sh",
  #     ]
  #   }
  #   provisioner "local-exec" {
  #     command = "echo ${self.private_ip} >> private_ips.txt"
  #     when    = destroy
  #   }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2X62YA8DOIbsZJ0xEk+9bYo4O6ZFTMGm9J43+jpdFX64PDyx47g9GVL1d26L4lifWX00fou8gqSUEUKbl9s2eksN8peWFq4bks+0bo/jknP22USP75pw5h6tcEF4bmphTEPvbCqo7XxW5RuQdy2QXSRXIGOa8Yd8g6UdXFU/jeb15xI3Y9x+TGHBca6EQSuWFAkjonVXudeh1/nz0JWMUBc99zF+BBG5q4CclVx4aHqG9B2BPmMMmB6so9WYxhHRH9Dqa6Ei/NVTrBSNGaWr/hKRt5RLCazHDvh/3V01bLRRIR9PG+4r8654SFRSDXHgFA7GdtElXFrp1vDs90u0n+i/NwbFwJnhj8L/MtzYGjREFm5+LmSXM5Xestk23wLGZHn3QhHiJYG4bQChoaKvxciO539yE6nlE9ujh2MM9id2sJ8lBVdxiLmddaIMbTRMVjzxuRTRpMncLH2hTDzmsAuoNpJm4nPMTevbsGGroshu5fj5DCH0PA9PEOGpCMCM= lbena@LAPTOP-QB0DU4OG"
}