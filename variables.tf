variable "app_name" {
  type    = "string"
  description = "Name of the beanstalk application"
}

variable "app_environment" {
  type    = "string"
  description = "Application environment e.g: QA,UAT,TEST,PROD"
}

variable "instance_type" {
  type    = "string"
  description = "Instance type to run e.g. t2.micro"
  default = "t2.micro"
}

variable "asg_min_instances" {
  type    = "string"
  description = "Min number of auto scaling instances"
}

variable "asg_max_instances" {
  type    = "string"
  description = "Max number of auto scaling instances"
}

variable "elb_scheme" {
  type    = "string"
  description = "ELB scheme setting e.g private,public"
  default =  "private"
}

variable "ec2_key" {
  type    = "string"
  description = "EC2 key setting (PEM) e.g ec2key"
  default =  "LenderSquad-Pem"
}


variable extra_tags {
  type    = "map"
  default = {} 
}
