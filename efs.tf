resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
   tags = {
     Name = "EFS"
   }
 }


 resource "aws_efs_mount_target" "efs-mtpublic0" {
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = module.vpc.public_subnets[0]
   security_groups = [aws_security_group.efs.id]
 }

 resource "aws_efs_mount_target" "efs-mtpublic1" {
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = module.vpc.public_subnets[1]
   security_groups = [aws_security_group.efs.id]
 }

 resource "aws_efs_mount_target" "efs-mtpublic2" {
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = module.vpc.public_subnets[2]
   security_groups = [aws_security_group.efs.id]
 }