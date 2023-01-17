resource "aws_security_group" "eks" {
  name        = "allow_efs"
  description = "Allow efs outbound traffic"
  vpc_id      =  module.vpc.vpc_id
  ingress {
     cidr_blocks = ["0.0.0.0/0"]
     from_port = 22
     to_port = 22
     protocol = "tcp"
   }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_efs"
  }
}

resource "aws_security_group" "efs" {
   name = "efs-sg"
   description= "Allos inbound efs traffic from eks"
   vpc_id =  module.vpc.vpc_id

   ingress {
     cidr_blocks = ["10.0.0.0/16"]
     from_port = 2049
     to_port = 2049 
     protocol = "tcp"
   }     
        
   egress {
     cidr_blocks = ["0.0.0.0/0"]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }
 }