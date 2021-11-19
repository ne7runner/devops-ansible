provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.small"
  key_name = "marcin-import-keypair"

  tags = {
    Name = "Marcin-devops-server"
    env = "prod"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} >> /root/inv"
  }
}

