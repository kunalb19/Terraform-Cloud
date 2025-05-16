############
resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "thinknyxkeypair"
  public_key = tls_private_key.keypair.public_key_openssh
  tags       = local.tags
}