module "networking" {
  source             = "./networking"
  vpc_cidr           = "10.0.0.0/16"
  public_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
  private_cidrs      = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}