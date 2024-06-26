#terraform code to launch EC2 instance

resource "aws_instance" "web"  {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  security_groups =  [aws_security_group.TF_SG.name]

  tags = {
    Name = "Terraform EC2"
  }
}

# security group using terraform

resource "aws_security_group" "TF_SG" {
  name        = "security group using terraform"
  description = "security group using terraform"
  vpc_id      = "vpc-02d6bf66bce20008f"

 ingress{
    description     = "HTTPS"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 }

ingress{
    description     = "HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 }

 ingress{
    description     = "SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 }

egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 }

tags = {
   Name = "TF_SG"
}
}
