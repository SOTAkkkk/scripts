# cron

## crontab
```shell
crontab -e
```

```shell
分 時 日 月 曜 スクリプト
* * * * * script.sh
```

- 曜日
```shell
日 月 火 水 木 金 土
０ １ ２ ３ ４ ５ ６
```

- 例
  - 02:30 毎日 毎月 日曜日
  - 14:30 毎日 毎月 日曜日
```shell
30 2,14 * * 0 script.sh
```