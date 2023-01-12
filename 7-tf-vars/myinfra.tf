variable owner {
    type = string
}

variable "basezone" {
  type = string
}

output printname {
        value = "Details ${var.basezone} & ${var.owner}"
}