# systemcd 

## journald 
systemdのログをみる
```shell
sudo journalctl -u サービス名 --since "2023-02-24 20:00:00"
```

## firewalld
- サービスを指定
```shell
sudo firewall-cmd --zone=public --add-service=ssh --permanent
```

- ポートを指定
```shell
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
```
- firewalldを再起動
```shell
sudo firewall-cmd --reload
```
- 有効になってるpublicゾーンの設定内容を確認
```shell
sudo firewall-cmd --list-all
```

- firewalld自動起動の有効＆無効設定
```shell
sudo systemctl enable firewalld //有効
sudo systemctl disable firewalld //無効
```

- 再起動
```shell
sudo systemctl restart firewalld 
```
