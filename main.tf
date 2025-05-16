############
resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = local.name
  public_key = tls_private_key.keypair.public_key_openssh
  tags       = local.tags
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04 LTS
  instance_type = "t2.micro"
  tags = {
    Name = local.name
  }
}