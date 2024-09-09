resource "aws_instance" "roboshop" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    tags = {
        name = each.key
    }
}

resource "aws_route53_record" "www" {
    for_each = aws_instance.roboshop #if we want to map or get the data we have to map use other mapped resource name
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain}"
    type    = "A"
    ttl     = 1
    records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}

#  output "aws_instance_info" {
#     value = aws_instance.roboshop.instance_type
  
#  }




resource "aws_security_group" "roboshop" {
    name = "roboshop"      
    description = "Allow http ssh https" 

    dynamic "ingress" {   #if we use dynamic it repeat the configuraation
        for_each = var.ingress    #from here for each it will get the value and fromm their we get the data ingress.value[""]
        content {
            description = ingress.value["description"]
            protocol  = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
            from_port = ingress.value["from_port"]
            to_port   = ingress.value["to_port"]
        }
      
    }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "roboshop"
  }
}

