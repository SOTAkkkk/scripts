# scripts
代表的なコマンドや実用的なスクリプトを収集したリポジトリ
## シェルスクリプト
- 先頭に記述する
```shell
#!/bin/bash
```
## curl
- POST
```shell
curl -X POST -H "Content-Type: application/json" -d '{"name":"太郎", "age":"30"}' ${url}
```
## aws cli

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
## FTP コマンド(curl)

```shell
curl -u ${user} ftp://${endpoint}
```
- アップロード
```shell
curl -T ${file} -u ${user} ftp://${endpoint}
```
- ダウンロード
```shell
curl -l -O -u ${user} ftp://${endpoint}/${path}/${file}
```
## lftp コマンド
```shell
lftp -d -u ${user} ftp://${endpoint}
```
## FTPS コマンド
- `--ftp-ssl`をつけるだけ
```shell
curl -u ${user} --ftp-ssl ftp://${endpoint}
```
- 証明書エラーを無視
  - `-k`をつける
```shell
curl -u ${user} --ftp-ssl -k ftp://${endpoint}
```
## SFTP コマンド
```shell
sftp ${endpoint}
```
```shell
curl -u ${user} sftp://${endpoint}
```
## cron
## ansible
## 秘密鍵・公開鍵を作成
## 証明書チェーンの確認
```shell
openssl s_client -connect ${endpoint}:443 -showcerts
```
