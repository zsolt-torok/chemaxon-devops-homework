# Chemaxon DevOps Homework

## Exercise 1

Create a terraform module that does the following:

1. Deploys a VPC with internet access
1. 4 subnets across 2 AZs
    * 2 Public subnets, designed to host a load balancer or reverse proxy
        * Can communicate directly with the internet
    * 2 private designed to host application servers
        * internet access for outbound connections.
1. Ensure that calls to the S3 API from within the VPC does not leave the AWS backbone network for security and cost reduction.
1. Create an example where you use the module.

No need to actually deploy this, code is enough! Some resources required here are not included within the free tier, do not spend money! The main goal is that the terraform plan runs successfully.

## Exercise 2

We have an application that stores data on a filesystem, and our backup policy requires that it stores backups for 180 days and no more. You have selected S3 as the backup storage in a different account.

Your goal is to ensure these backups are stored according to best practices. Please implement an S3 bucket with the appropriate configuration you think of as best practices for this task. Recommended ways to approach the problem are security, cost considerations.

Actually uploading the files as a cron job or something is not part of this exercise, but you have to ensure that the following IAM role is able to upload files into the bucket arn:aws:iam::123456789012:role/backup_uploader (its a fake :)).
