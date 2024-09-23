function assume-role() {
  aws_sts_out=$(aws sts assume-role --role-arn $1 --role-session-name $2);\
  export AWS_ACCESS_KEY_ID=$(echo $aws_sts_out | jq -r '.Credentials''.AccessKeyId');\
  export AWS_SECRET_ACCESS_KEY=$(echo $aws_sts_out | jq -r '.Credentials''.SecretAccessKey');\
  export AWS_SESSION_TOKEN=$(echo $aws_sts_out | jq -r '.Credentials''.SessionToken');
}
