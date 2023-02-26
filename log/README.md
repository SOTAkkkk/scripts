# logの収集

## 

## FTPのログを確認する
### grep
- アップロード
```shell
sudo cat /var/log/proftpd/all.log | grep STOR
```

- "xxxx"を含まない行だけを表示 
```shell
sudo cat /var/log/proftpd/access.log | grep -v "xxxx"
```

## openrestyのログを確認する
```shell
sudo cat /var/log/nginx/access.log
```
- ログの例
```shell
remote_addr - remote_user [time_local] "request" status body_bytes_sent "http_referer" "http_user_agent"
```
- `remote_addr`: リクエストを送信したクライアントのIPアドレス
- `-`: 認証されたユーザー名（このフィールドは常にハイフンで表されます）
- `time_local`: リクエストが受信された時刻（日付と時間）
- `request`: リクエストの内容（HTTPメソッド、URL、HTTPバージョンなど）
- `status`: HTTPレスポンスステータスコード（200 OKなど）
- `body_bytes_sent`: レスポンスの本文のサイズ（バイト）
- `http_referer`: リクエストを発生させたページのURL（リファラ）
- `http_user_agent`: リクエストを送信したクライアントのブラウザやOSの情報（ユーザーエージェント）

```shell
cat /var/log/nginx/access.log | cut -d " " -f 1,9 | sort | uniq -c | sort -rn | head -n 10
```
```shell
awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -rn
```
- 特定の日付以降のログを収集
```shell

```
- sshログインに失敗したユーザーを調べる
```shell
sudo cat /var/log/secure | grep "invalid user"
```

- proftpdのログをみる
```shell
sudo tailf /var/log/proftpd/all.log
```

### 単語数をカウント
```shell
wc /var/log/nginx/access.log
```
