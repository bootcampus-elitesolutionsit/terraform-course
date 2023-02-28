resource "aws_instance" "demo_server" {
  ami           = coalesce(data.aws_ami.ubuntu.id, var.ami)
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_id[3]
  # vpc_security_group_ids = [module.vpc.security_group_id]
  key_name = aws_key_pair.ssh_key.key_name
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI1rcaxY1qw5dJNZpgIDxDX+MeCwQVvz0KV6hY+OLbWDgy3rbNr0enRs3S7pcV9dpTnebpcCwjhgMEiVilk20u1oXAulhS75ZNRvvrAAn8OHyzympDcA5Ra70mgBg6ERpUZMDrDPvzFMfFZx9PsDDdATrnQ4/AOJPKp+Zn1wcSznK8FxvHrXJ70hlkJ3RKfdSMk6c8g0NsUfzSIvPcyF2l5Dw3iuifQ1ylDtlJEzGqjc9RoeVcIwRAYOjDpu1rhQMd+fzMfuIv0WVTL5vkUeIvQii8SlwkoOwGqOfK4BbIhwN6VoNn9dpPEDL8l7kPkOga3aJkGvChW3uemlSvWtZh1UyhSj4GHMMPG3A1f9mv6cyKDC0v33skeHfyhsplw9v5LG5KQxOrQYkTUInv6ENw+MzYYgSOrHkmgny7nPxVHIrA2FCITDKQ25dnPd661cqEEem13XftSrVPGtBoZgfXDhlIhQ3Rlijk3DMpfCIX9HaYESiUuI0RCSCiJY9ik4k= lbena@LAPTOP-QB0DU4OG"
}