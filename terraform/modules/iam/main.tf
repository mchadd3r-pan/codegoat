data "aws_iam_policy_document" "example-policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "admin-role" {
  name                = "${var.environment}_admin_role"
  assume_role_policy  = data.aws_iam_policy_document.example-policy.json # (not shown)
  managed_policy_arns = []
  tags = {
    git_org   = "mchadd3r-pan"
    git_repo  = "codegoat"
    yor_trace = "5a560052-6ac0-4b4f-a220-9b01ec209609"
  }
}
