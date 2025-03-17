variable "rgname" {
  type = string
}
variable "location" {
  type = string
}
variable "addressspace" {
  type = list(string)
}
variable "subnetaddressspace" {
    type = list(string)
}
# variable "sid" {
#     type = string
#     sensitive = true
# }

variable "vnetname" {
  type = string
}
variable "subnetname" {
  type = string
}