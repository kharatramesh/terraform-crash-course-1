resource "aws_key_pair" "nkp" {
  key_name   = var.keyname
  public_key = file("~/.ssh/id_rsa.pub")
}
