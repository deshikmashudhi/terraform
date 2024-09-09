#this creates ec2 instance in default vpc
resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    
}
