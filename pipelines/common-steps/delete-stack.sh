#!/bin/bash

set -x

export AWS_DEFAULT_REGION=us-east-1
aws cloudformation delete-stack --stack-name todo-list-aws-${ENVIRONMENT}
