terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.53.0"
   }
 }

  backend "s3" {
   bucket = "ilyas-state"
   key    = "state"
   region = "us-east-2"
 }

}
