# Name<br>＜ Gjden--ジジデン ＞
〜迷える同僚"おジジ社員"をGoodJobに導く伝票アプリ〜<br>

![ロゴマーク](ロゴまーく.png)

## ＜ Overview--概要 ＞
【宴会場の予約伝票管理アプリ】<br>

宴会場及び、会議室などの貸し出しスペースの予約管理を目的とした社内用アプリケーションです<br>
<br>
＜このアプリケーションでどのような課題が解決できるのか？＞<br>
①伝票の紛失するリスクをゼロへ<br>
②予約の重複リスクをゼロへ<br>
③全社員へ予約内容の共有<br>
④外出先でも確認が可能<br>

## ＜ Production environment--本番環境 ＞
https://gjden1111.herokuapp.com/ <br>
ID：admin　PASS：2525<br>
<br>
社員ユーザー1<br>
メールアドレス　：　sasaki@test <br>
パスワード　　：　111aaa <br>
<br>
社員ユーザー2<br>
メールアドレス　：　suzukii@test <br>
パスワード　　：　aaa111 <br>

## ＜ Project justification--制作背景 ＞
【紙媒体での予約管理の不便さを解決したい】<br>
<br>
宴会場で働いている際、沢山ある会場の予約スケジュール管理を紙媒体で管理していました。<br>
新規予約の伝票を見落とした、無くしたという<b>トラブルを無くしたい</b>という思いからこのアプリが生まれました。<br>
また、<b>パソコンに苦手意識を持つ ”おジジ社員”</b> と共に働いていたことから、彼らにとって使いやすいアプリケーションにする事で<b><span style="color: red">パソコンへの興味のきっかけとなってほしい</span></b>という願いも込められています。


## ＜ Top page--トップページ ＞
【point1】<br>
予約の確認漏れを防ぐため、未確認の伝票はこちらに全て表示されます。<br>
![上](上ポイント.jpeg)<br>
![下](２４日をクリック.jpeg)<br>
![日毎](２４日ページ.jpeg)<br>
【point2】<br>
見たい日がすぐ見つかるようにカレンダー形式を採用しました。<br>
更に、日毎のページは昼と夜で分けて表示しています。<br>

## ＜ Ingenuity--工夫 ＞
【アプリ内迷子をトップページへ導く】<br>
パソコンが苦手なユーザーのために、ロゴマークに変化を付けました。<br>黒いロゴマークがトップページです。今どこのページを開いているのか分からなくなったら、黒いロゴマークを目標に戻ってきて下さいね！<br>
【仮予約の際は時間入力を短縮】<br>
はっきりした時間が決まっていないけど仮予約…！という時はこちらのボタンで指定の時間帯をワンクリックで入力ができます。

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many: reservations
- has_many: looks

## reservations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| day           | date       | null: false                    |
| time          | time       | null: false                    |
| end_time      | time       | null: false                    |
| group_name    | string     | null: false                    |
| manager       | string     |                                |
| phone_number  | string     |                                |
| people_number | integer    |                                |
| room_id       | integer    | null: false                    |
| use           | string     |                                |
| user          | references | foreign_key: true              |
| start_time    | string     |                                |
| finish_time   | string     |                                |

- belongs_to: user
- has_many: looks

## looks テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| user        | references  | null: false, foreign_key: true |
| reservation | references  | null: false, foreign_key: true |

- belongs_to: user
- belongs_to: reservation
