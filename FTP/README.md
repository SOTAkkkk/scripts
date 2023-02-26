# FTP コマンド(curl)

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

## ログを確認する
- アップロード
```shell
sudo cat /var/log/proftpd/all.log | grep STOR
```
