# aws cli

[リファレンス](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html#cli-aws-s3api)

- 接続設定
```shell
aws configure
```
- GET
```shell
aws --endpoint-url ${url}:${port} s3 ls s3://${bucket}
```
- HEAD
```shell
aws s3api head-object --bucket ${bucket} --endpoint-url ${url}:${port} --key ${file}
```

- アップロード
```shell
aws s3 cp ${file} s3://${bucket} --endpoint-url ${url}:${port}
```
```shell
aws s3api put-object --bucket ${bucket} --key ${file} --endpoint-url ${url}:${port}
```
- multi-upload
```shell
# InvalidAccessKeyId
aws s3api complete-multipart-upload --bucket ${bucket} --key ${file} --upload-id ${AccessKeyId} --endpoint-url ${url}:${port}
```
