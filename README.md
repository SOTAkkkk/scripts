# scripts
代表的なコマンドや実用的なスクリプトを収集したリポジトリ
## シェルスクリプト
- 先頭に記述する
```shell
#!/bin/bash
```

## read オプション
- `-e`
  - 入力補完
- `-s`
  - 入力した文字が見えないようにする
```shell

```
## ダミーファイルの作成方法
```shell
export file=dummy_1000MB_file
dd if=/dev/zero of=${file} bs=1000*1024*1024 count=1
```
- bsの指定方法
  - `bs=1M`,`bs=1G`

## date
```shell
date +%Y-%m-%d-%H
```
## curl
- POST
```shell
curl -X POST -H "Content-Type: application/json" -d '{"name":"太郎", "age":"30"}' ${url}
```

## cron
### crontab 一覧(list)をみる
```shell
sudo crontab -l
```
## Ansible
### vault
- 暗号化
```shell
ansible-vault encrypt ${file}
```
- 複合化
```shell
ansible-vault decrypt ${file}
```
## 証明書の作成
### 秘密鍵の作成
- 例
  - 鍵の長さを指定( 2048 以上が望ましい)
  - 共通鍵暗号方式(desは使うべきではない)
```shell
openssl genrsa -aes256 -out path/to/server.key 2048
```
#### 秘密鍵からパスフレーズを取り除く
```shell
openssl rsa -in <パスフレーズ付き秘密鍵> -out <出力先ファイル名>
```
### CSRの作成
- 例
  - `-key`で使用する秘密鍵を指定
```shell
openssl req -new -key server.key -out server.csr
```
### SSL証明書の作成
- 自分で証明書に署名する場合
- 例
```shell
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
```
| オプション     | 説明              |
|-----------|-----------------|
| -req      | CRTの生成を指定します。   |
| -days     | 有効期限を日数で指定します。  |
| -in	      | CSRファイルを指定します。  |
| -signkey	 | 署名に使う秘密鍵ファイルを指定します。|
| -out	     | 出力ファイル名（証明書ファイル）を指定します。|

### 証明書チェーンの確認
| 項目  | 説明                  |
|-----|---------------------|
| Issuer（発行者の情報）  | その証明書の発行者の情報    |
| Subject（サブジェクト） （主体の情報）  | 証明書が証明している主体（対象）の情報   |
| 有効期限  | 設定した有効期限になっているか確認する。 |
```shell
openssl s_client -connect ${endpoint}:443 -showcerts
```
- 例
```shell
openssl s_client -connect www.yahoo.co.jp:443 -showcerts
```
