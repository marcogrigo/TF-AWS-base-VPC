terraform {
  backend "s3" {
    bucket = "marcogrigotf-20230405"
    key    = "remote.tfstate"
    region = "eu-west-1"
  }
}