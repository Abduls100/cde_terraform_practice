terraform {
  backend "s3" {
    bucket       = "cde-data-engineering-practice"
    key          = "staging/data_team.tfstate"
    use_lockfile = true
    region       = "eu-north-1"
  }
}
