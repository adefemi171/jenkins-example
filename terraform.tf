terraform {
    backend "s3" {
        bucket="terrabuck1"
        key="terraform-example1"
        region="us-east-2"
    }
}