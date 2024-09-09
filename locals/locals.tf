resource "aws_key_pair" "deployer" {
  key_name   = "jenkins-pub"
  public_key = local.key_public  #to create aws key pair using terraform
}


resource "aws_instance" "jenkins" {
  ami = local.ami_id
  instance_type = local.instance_type 
  key_name = aws_key_pair.deployer.key_name
  
}