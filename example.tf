provider "aws" {
  
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terrabuck1"
  acl = "public"
  
  tags = {
    Name = "My bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_launch_template" "template"{
  name_prefix = "template"
  image_id = "ami-2757f631"
  instance_type = "t2.micro"

}

resource "aws_autoscaling_group" "terraform-example"{
  availability_zones = ["us-east-1"]
  desired_capacity = 0
  max_size = 0
  min_size = 0

  launch_template {
    id = "${aws_launch_template.template.id}"
    version = "$Latest"
  }
}
