// Take input 
variable infraname {}

output printname {
    value = "Hello, ${var.infraname}"
}


// also to pass from command line the variable value - use 
    # terraform plan -var "infraname=ucp-dev"