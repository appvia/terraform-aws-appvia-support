#
## Related to cloud providers
#

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "cudos"
  region = var.region

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_accounts["cudos"]}:role/AWSControlTowerExecution"
  }
}

#provider "aws" {
#  alias  = "cudos"
#  region = var.region
#
#  assume_role_with_web_identity {
#    role_arn                = "arn:aws:iam::${var.aws_accounts["cudos"]}:role/${data.aws_iam_session_context.current.issuer_name}"
#    session_name            = var.provider_session_name
#    web_identity_token_file = var.provider_web_identity_token_file
#  }
#}
