/*
variable "sp_id" {
}

variable "sp_secret" {
}
*/


# Variable para el nombre base de los recursos
variable "name" {
  description = "Nombre base para todos los recursos"
  #default     = "demoappjef0010"  # Valor por defecto (si no se pasa un valor)
}

# Variable para la ubicación de los recursos
variable "location" {
  description = "Ubicación de los recursos"
  #default     = "East US"  # Valor por defecto (si no se pasa un valor)
}
