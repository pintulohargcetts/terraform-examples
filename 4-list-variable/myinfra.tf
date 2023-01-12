variable environment {
    type = list
}

output printfirst {
  value = "envs:  ${(var.environment[1])} , ${(var.environment[2])} ${(var.environment[3])}"
}

# Enter input in the following form :
# var.users Enter a value: [ "dev", "qa", "prod"]


