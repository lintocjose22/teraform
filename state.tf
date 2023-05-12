terraform {
  backend "s3" {
    bucket = "statetera"
    key    = "linto/ethan//key"
    region = "us-east-1"
  }
}