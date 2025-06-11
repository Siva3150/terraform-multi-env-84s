variable "project_name" {
    default = "roboshop"
}

variable "environment" {

}

variable "instance_type" {
    
}

variable "common_tags" {
        default = {
            project = "Roboshop"
            Terraform = "true"
        }
    }


 variable "sg_name" {
     default = "allow-all"
 }

 variable "sg_description" {
   default = "allowing all ports from internet"
 }


 variable "from_port" {
    type = number
    default = 0
}

 variable "to_port" {
    type = number 
    default = 0
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
}

variable "instances" {
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI ID of joindevops RHEL9"
}

# variable "zone_id" {
#     default = "Z03672276PNJXQMW5BRF"
# }

# variable "domain_name" {
#     default = "sivadevops.fun"
# }






