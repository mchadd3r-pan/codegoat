resource "aws_subnet" "primary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_primary
  availability_zone = "${var.region}a"
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "6f22cc9b-0bcc-4ba4-a394-7131e029b08d"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_secondary
  availability_zone = "${var.region}c"
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "ab35bedd-6962-4609-ba93-bb9c9206aaed"
  }
}
