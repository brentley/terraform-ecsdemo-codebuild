    terraform {
      backend "s3" {
        bucket         = "651426287273-ecsdemo-dockerhub-tf-state"
        key            = "terraform.tfstate"
        region         = "us-east-2"
        encrypt        = false
        dynamodb_table = "651426287273-us-east-2-dynamodb-terraform-lock-table"
      }
    }
    