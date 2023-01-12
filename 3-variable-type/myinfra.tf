variable username {
  type = string
  default = "aws-user"

}

variable age {
  type = number
  default = 23
}


output "printvariable" {
  value = "Hello ${var.username} and your age is ${var.age}"
}