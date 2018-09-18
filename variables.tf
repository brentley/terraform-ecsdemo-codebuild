provider "aws" {
  region     = "us-east-2"
}

variable "namespace" {    # Used in some naming. I use the domain name minus TLD.
  default = "ecsdemo-dockerhub"
}

variable "namespace_nodejs" {    # Used in some naming. I use the domain name minus TLD.
  default = "ecsdemo-nodejs-dockerhub"
}

variable "namespace_frontend" {    # Used in some naming. I use the domain name minus TLD.
  default = "ecsdemo-frontend-dockerhub"
}

variable "namespace_crystal" {    # Used in some naming. I use the domain name minus TLD.
  default = "ecsdemo-crystal-dockerhub"
}

variable "github_url_nodejs" {   # Github URL (tested with https, not git://)
  default = "https://github.com/brentley/ecsdemo-nodejs.git"
}

variable "github_url_frontend" {   # Github URL (tested with https, not git://)
  default = "https://github.com/brentley/ecsdemo-frontend.git"
}

variable "github_url_crystal" {   # Github URL (tested with https, not git://)
  default = "https://github.com/brentley/ecsdemo-crystal.git"
}

variable "github_owner" {
  default = "brentley"
}

# this should be set in your environment as "TF_VAR_GITHUB_TOKEN"... so > export TF_GITHUB_TOKEN=xxxxxxx
variable "GITHUB_TOKEN" {}
