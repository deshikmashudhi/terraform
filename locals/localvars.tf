locals {
  ami_id = "ami-066784287e358dad1"
  key_public = file("${path.module}/jenkins.pub")
  instance_type = var.isProd ? "t3.medium" : "t2.micro" 
  
  
}

variable "isProd" {
    default = false
  
}