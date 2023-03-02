

provider "" {
  
}

data "" "name" {
  
}

provisioner "remote_exec"  {}

provisioner "file" {}

provisioner "local_exec" {}

dynamic (

    for_each
)

locals {
    var1="algo"

    var2 = {
        dia = "27"
        mes = "12"

        dia2= "14"
        mes2= "07"
    }
  
}

variable "vars" {
  
}

resource "null_resource" "name" {
  
}

resource "output "name" {
  
}

# terraform.tfvars te permite reemplazar valores de variables dentro del manifest

# modules



module "" {
    source = ""
    
}

#modules sirven para reusar un codigo que crea determinados recursos con ciertas caracterisiticas
#de esta manera podes usar modulos escritos por terceros y evitas tener que crear mas codigo
# vos podes crear tus propios modulos y reutilizarlos cuantas veces quieras
#si vos creas el module tener que meter todas los files en un folder llamado ./terraform
# por ej si llamas a la folder networking el modulo se va a llamar igual



