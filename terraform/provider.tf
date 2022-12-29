terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 4.19.0"
   }
 }

  backend "s3" {
   bucket = "ilyas-states"
   key    = "state"
   region = "eu-central-1"
 }

}
