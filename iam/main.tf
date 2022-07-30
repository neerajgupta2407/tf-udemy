provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5OSIP2ICSBRIZDFW"
  secret_key = "A+49/ZSHtDkNPFCI82VTebiQb5qYcRhL5hEyvV27"
}


resource "aws_iam_user" "myUser" {

    name = "NeerajIamTf"
}


resource "aws_iam_policy" "iam_policy" {
  name = "DummyPolicyTemplate"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "glacier:DescribeJob",
                "glacier:DescribeVault",
                "glacier:GetDataRetrievalPolicy",
                "glacier:ListVaults"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}

  EOF
}


resource "aws_iam_policy_attachment" "policy_attach" {

  name = "attachment"
  policy_arn = aws_iam_policy.iam_policy.arn
  users = [aws_iam_user.myUser.name]
}