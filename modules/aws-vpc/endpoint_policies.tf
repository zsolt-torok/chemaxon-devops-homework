data "aws_iam_policy_document" "s3_gateway_policy" {
  statement {
    actions   = ["s3:*"]
    resources = ["*"]
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

data "aws_iam_policy_document" "vpc_endpoint_default_policy" {
  statement {
    sid    = "AllowAccess"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["*"]
    resources = ["*"]
  }
}
