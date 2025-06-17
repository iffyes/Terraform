variable "instance_name" {
  description = "Default name for instance"
  type        = string
  default     = "hello-server"
}

variable "instance_type" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

