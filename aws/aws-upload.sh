#!/bin/bash -eu

# 変数
# export endpoint=
# export port=
# export bucket=
export file=dummy_1000MB_file

echo "-------------------------------------"
echo "awsアカウントの情報を設定してください。"
echo "-------------------------------------"
aws configure

echo "-------------------------"
echo "endpointを入力してください。"
echo "-------------------------"
read endpoint

echo "-------------------------"
echo "portを入力してください。"
echo "-------------------------"
read port

echo "-------------------------"
echo "bucketを入力してください。"
echo "-------------------------"
read bucket

echo "-------------------------------------"
echo "awsアカウントの情報を設定してください。"
echo "-------------------------------------"

echo "-------------------------------------"
echo "LIST表示"
echo "-------------------------------------"
aws --endpoint-url http://${endpoint}:${port} s3 ls s3://${bucket}

echo "-------------------------"
echo "ファイル生成"
echo "-------------------------"
dd if=/dev/zero of=${file} bs=1000*1024*1024 count=1

echo "-------------------------------------"
echo "ファイルをアップロード"
echo "-------------------------------------"
aws s3 cp ${file} s3://${bucket} --endpoint-url http://${endpoint}:${port}

echo "-------------------------------------"
echo "HEAD"
echo "-------------------------------------"
aws s3api head-object --bucket ${bucket} --endpoint-url http://${endpoint}:${port} --key ${file}

echo "-------------------------------------"
echo "LIST表示"
echo "-------------------------------------"
aws --endpoint-url http://${endpoint}:${port} s3 ls s3://${bucket}

echo "-------------------------------------"
echo "ファイルをダウンロード"
echo "-------------------------------------"
aws s3 cp s3://${bucket}/${file} download_file --endpoint-url http://${endpoint}:${port}

echo "-------------------------------------"
echo "サーバーのファイルを削除"
echo "-------------------------------------"
aws s3 rm s3://${bucket}/${file} --endpoint-url http://${endpoint}:${port}

echo "-------------------------------------"
echo "ローカルのファイルを削除"
echo "-------------------------------------"
rm ${file}
rm download_file
