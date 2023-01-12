variable environment {
    type = list
}

output printfirst {
  value = "envs:   ${join("--->",var.users)}"
}

# Enter input in the following form :
# var.users Enter a value: [ "dev", "qa", "prod"]


