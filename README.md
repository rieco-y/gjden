# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many: reservation

## reservations テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| day           | date    | null: false                    |
| start_time    | time    | null: false                    |
| end_time      | time    | null: false                    |
| group_name    | string  | null: false                    |
| manager       | string  | null: false                    |
| phone_number  | string  | null: false                    |
| people_number | integer | null: false                    |
| room_id       | integer | null: false                    |
| use           | string  | null: false                    |

- belogs_to: user