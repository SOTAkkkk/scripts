#!/bin/bash -eu

# 環境変数
# export ftp_user=
# export ftp_pass=
# export endpoint=
export file=dummy_1000MB_file

echo "-------------------------------------"
echo "FTPアカウントのユーザー名を入力してください。"
echo "-------------------------------------"
read ftp_user

echo "-------------------------"
echo "パスワードを入力してください。"
echo "-------------------------"
read -s ftp_pass
echo "パスワードが入力されました。"

echo "-------------------------"
echo "endpointを入力してください。"
echo "-------------------------"
read endpoint

echo "-------------------------"
echo "list表示"
echo "-------------------------"
curl -u ${ftp_user}:${ftp_pass} ftp://${endpoint}

echo "-------------------------"
echo "ファイル生成"
echo "-------------------------"

dd if=/dev/zero of=${file} bs=1000*1024*1024 count=1

echo "-------------------------"
echo "ファイルをアップロード"
echo "-------------------------"
curl -T ${file} -u ${ftp_user}:${ftp_pass} ftp://${endpoint}

echo "-------------------------"
echo "list表示"
echo "-------------------------"
curl -u ${ftp_user}:${ftp_pass} ftp://${endpoint}

echo "-------------------------"
echo "ファイルをダウンロード"
echo "-------------------------"
curl -l -O -u ${ftp_user}:${ftp_pass} ftp://${endpoint}/${file}

echo "-------------------------------------"
echo "サーバーのファイルを削除"
echo "-------------------------------------"
curl -Q "DELE ${file}" -u ${ftp_user}:${ftp_pass} ftp://${endpoint}/

echo "-------------------------"
echo "list表示"
echo "-------------------------"
curl -u ${ftp_user}:${ftp_pass} ftp://${endpoint}

echo "-------------------------------------"
echo "ローカルのファイルを削除"
echo "-------------------------------------"
rm ${file}
