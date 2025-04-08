
# example of using data source to get the latest ami id for ubuntu 22.04

# data "aws_ami" "os1"{

#     filter {
#       name = "state"
#       values = ["available"]
#     }
#     filter {
#       name = "virtualization-type"
#       values = ["hvm"]
#     }
#     filter {
#       name = "architecture"
#       values = ["x86_64"]
#     }
#     filter {
#       name = "name"
#       values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#     }
#     most_recent = true
#     owners      = ["099720109477"]
# }

# # example of using data source to get the latest ami id for ubuntu 24.04
# data "aws_ami" "os1" {
#     most_recent = true
#     owners     = ["099720109477"]
#     filter {
#         name   = "state"
#         values = ["available"]
#     }
#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
#     filter {
#         name   = "architecture"
#         values = ["x86_64"]
#     }
#     filter {
#         name   = "name"
#         values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305"]
#     }
#     # most_recent = true
#     # owners      = ["099720109477"]
# }

# output "name-of-ami" {
#     value = data.aws_ami.os1.name
  
# }


# # # example of using data source to get the latest ami id for ubuntu 24.04
# data "aws_ami" "os1" {
#     most_recent = true
#     owners     = ["099720109477"]
# }
# output "name-of-ami" {
#     value = data.aws_ami.os1.name
  
# }

# data "aws_ami" "os1" {
#     most_recent = true
#     owners = ["amazon"]
# }

# output "name-of-ami" {
#     value = data.aws_ami.os1.name
# }

# data "aws_ami" "os1" {
#     #  most_recent = true
#     owners = ["099720109477"]
#      filter {
#         name = "architecture"
#         values = ["x86_64"]
#      }
#      filter {
#         name = "root-device-type"
#         values = ["ebs"]
#      }
#     filter {
#         name = "virtualization-type"
#         values = ["hvm"]
#      }
#      filter {
#         name = "name"
#         values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305"]
#      }
#      filter {
#         name = "state"
#         values = ["available"]
#      }
#     #  most_recent = true
# }
 
data "aws_ami" "lubuntu" {
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305"]
    }
}
 output "name-of-ami" {
     value = data.aws_ami.lubuntu.name
 }