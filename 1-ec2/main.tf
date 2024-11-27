data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "pin2402g9" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.pin2402g9_vpc.id]
  key_name               = "g9"
  user_data = "${file("install_soft.sh")}"
  tags = {
    name = "pin2402g9-bastion"
    environment = "test"
  }
  
}

 