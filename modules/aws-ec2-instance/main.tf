resource "aws_instance" "app_server" {
  ami           = "ami-0e5f882be1900e43b"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0e3fe1d570179a9e7", "sg-0177922ebcef4852e"]
  subnet_id              = "subnet-01e5894fde6e0fdad"

  tags = {
    Name = var.instance_name
  }
}
