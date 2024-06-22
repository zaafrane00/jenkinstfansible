provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0b17db95571fd002c"  # Replace with your desired AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > instance_ip.txt"
  }
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}
