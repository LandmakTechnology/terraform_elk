# My variables
variable "PATH_TO_PRIVATE_KEY" {
  description = "Private key path"
  default = ""
}

variable "instance_type"{
  type = string
  default = "t2.medium"
}

variable "my_key"{
  type = string
  default = ""
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "aws_region"{
  type = string
  default = ""
}
