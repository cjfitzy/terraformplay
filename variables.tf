
variable "bucket_name" {
  default     = "clairesbucket2"
}


variable "instance_type" {
  default     = "t3.micro"
}


#variable "image_id" {
#  default     = "ami-0fb391cce7a602d1f"
#}



#Variable attribute types:
#- string (an empty string is default)
#- numbers - can be null or 0 
#- bool - false could be empty
#- list - incidcated by [] comma seperated. tuples too: ()
#- map: dicotinaory {} - key vlaue pairs
#- null can be any

#validation

#the validation block allows you to define conditions that must be my_bucket by the variable 

#sensitive - marking a variable as sensistive vlaue will not be showing in output to cli

#nullable - if nullable is true we can set null in the variable configuration defaults to true

#defults is default is provided the variable used its value if not it will be asked for when running terraform

variable "image_id" {
  type = string
  description = "The id of the machine image (ami) to use for the server"

  validation {
    condition = length(var.image_id) > 4 && substr(var.image_id,0,4) == "ami-"

    error_message = "The image id value must be longer than 4 and start with 'ami-' "
  }

}











