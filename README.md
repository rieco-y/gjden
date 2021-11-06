# ＜ NAME : Gjden--ジジデン ＞<br>###〜迷える同僚、おジジ社員をGoodJobに導く伝票アプリ〜

![ロゴマーク](ロゴまーく.png)

## ＜ Overview--概要 ＞<br> ###宴会場の予約伝票管理アプリ

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

## ＜ Project justification--制作背景 ＞<br> ###紙媒体での予約管理の不便さを解決したい
宴会場で働いている際、沢山ある会場の予約スケジュール管理を紙媒体で管理していました。<br>
新規予約の伝票を見落とした、無くしたというトラブルを無くしたいという思いからこのアプリが生まれました。<br>
また、パソコンに苦手意識を持つ ”おジジ社員” と共に働いていたことから、彼らにとって使いやすいアプリケーションにする事でパソコンへの興味のきっかけとなってほしいという願いも込められています。


## ＜ Toppage--トップページ ＞
![上](トップ上.png)<br>
![下](トップ下.png)<br>

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
