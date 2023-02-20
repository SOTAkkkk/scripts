# scripts
# 説明
代表的なコマンドや実用的なスクリプトを収集したリポジトリ
## シェルスクリプト
- 先頭に記述する
```shell
#!/bin/bash
```
## curl
- GET
```shell
curl ${url}
```
## aws cli
```shell
aws configure
```
```shell
aws --endpoint-url ${url}:${port} s3 ls s3://${bucket}
```
## lftp コマンド
```shell
lftp -d -u ${user} ftp://${endpoint}
```
## cron
## ansible 
## 秘密鍵・公開鍵を作成
