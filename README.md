# Kinesis Data Generator for testing Firehose

## Overview

Terraform example that launches a pre-built Cloudformation template(klugey, I know) for Kinesis Data Generator(KDG) as well as Firehose, S3 and periphiral resources 

CFN template found at https://awslabs.github.io/amazon-kinesis-data-generator/web/help.html

## Usage

A username and password variables must be defined at launch for KDG. The S3 bucket destination for Firehose must be manually deleted before running `terraform destroy`


