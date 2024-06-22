provider "aws" {
  region = "eu-west-1"

    backend "s3" {
        bucket = "zaafranebucket"
        key    = "terraform.tfstate"
        region = "eu-west-1"  // Update this to the actual region of your S3 bucket
    }
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
