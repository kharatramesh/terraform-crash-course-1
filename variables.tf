
variable "nsgrule" {
  type        = list(map(any))
}
variable "keyname" {
  type =string
}
variable "vpc_cidr" {
  type = list(string)
}
variable "subnet_cidr1" {
  type = list(string)
}
variable "subnet_cidr2" {
  type = list(string)
}

variable "sgname" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "numberofvms" {
  type = number
}