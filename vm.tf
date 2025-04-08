data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_instance" "vm1" {
  lifecycle {
    create_before_destroy = true
  }
  count = var.numberofvms
  ami                         = data.aws_ami.lubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.s2.id
  vpc_security_group_ids      = [aws_security_group.sg1.id]
  key_name                    = aws_key_pair.nkp.key_name
  associate_public_ip_address = true
  tags = {
    Name = "${terraform.workspace}-Trainer-VM1-docker-${count.index}",
    dish ="pavbhaji"
    disk = "ssd"
  }
  provisioner "file" {
    source      = "docker.sh"
    destination = "/home/ubuntu/docker.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod a+x /home/ubuntu/docker.sh",
      "sudo bash /home/ubuntu/docker.sh"
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file(pathexpand("~/.ssh/id_rsa"))
    timeout     = "3m"
  }
}

output "ip-of-vm" {
  value = aws_instance.vm1[*].public_ip
}
