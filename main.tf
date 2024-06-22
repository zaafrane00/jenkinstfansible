provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0551ce4d67096d606"  # Replace with your desired AMI
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
