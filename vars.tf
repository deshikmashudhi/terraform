variable "ami_id" {
    type = string  # data type
    default = "ami-066784287e358dad1"  #default
}

variable "instances" {
   type = map   #this is mapping in terraform
   default = {
    #key         value
    Mangodb = "t3.medium"
    Mysql = "t3.medium"
    Reddis = "t2.micro"
    Rabbimq = "t2.micro"
    Catalouge = "t2.micro"
    User = "t2.micro"
    Cart = "t2.micro"
    Shipping = "t2.micro"
    Payment = "t2.micro"
    Web = "t2.micro"

   }  
}

variable "domain" {
    default = "devopslag.pro"
  
}

variable "zone_id" {
    default = "Z03161251MF3MPA8FIRRC"
  
}


variable "ingress" {
    type = list
    default = [
        {
            from_port = 80
            to_port = 80
            description = "allow port 80 from public ip" 
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]

        },

        {  
            from_port = 443
            to_port = 443
            description = "allow port 443 from public ip" 
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]

        },

        {
            from_port = 22
            to_port = 22
            description = "allow port 22 from public ip" 
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]

        }
        
    ]
  
}