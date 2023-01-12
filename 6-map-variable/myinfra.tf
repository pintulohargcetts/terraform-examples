variable "baseimage" {
  type    = "map"
  default = {
    "us-east-1" = "ani-image1-12345678"
    "us-west-2" = "ani-image2-12345678"
  }
}

output "print" {
    value = "The image is ${lookup(var.baseimage, "us-east-1")}"
}