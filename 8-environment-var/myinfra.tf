
//the value of username variable in the environment using the below command
   #  export TF_VAR_providername=AWS

variable "providername" {
  type = string
}

output printname {
        value = "Hello, ${var.providername}"
}

