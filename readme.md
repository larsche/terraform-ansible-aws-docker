user! 

{
	"Version": "2012-10-17",
	"Statement": [{
		"Sid": "CustomLaxPolicyForACGAWSTFCourse",
		"Action": [
			"ec2:*",
			"acm:*",
			"elasticloadbalancing:*",
			"ssm:Describe*",
			"ssm:Get*",
			"s3:*"
		],
		"Effect": "Allow",
		"Resource": "*"
	}]
}

to run docker

change the aws keys

docker-compose build

docker run -it  -v $(pwd)/terraform-data:/terraform nonbin/aws-ter-ansible:v0.2
