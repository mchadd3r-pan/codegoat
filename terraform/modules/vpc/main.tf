resource "aws_vpc" "example" {
  cidr_block = var.cidr
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "86a62fe7-ea4c-4a66-b862-d069096dc65b"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "734f2ab1-c6a2-4d52-ab73-891d575786f1"
  }
}

resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "613c26dd-1f86-4887-bdfc-786ea363aa30"
  }
}

resource "aws_security_group" "allow_ssh_from_valid_cidr" {
  name        = "allow_ssh_from_valid_cidr"
  description = "Allow SSH inbound from specific range"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = tolist([var.cidr])
  }
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "8fc1e34c-7686-4346-8826-fe55cf1a5ab3"
  }
}
