# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| nickname           | string       | null: false                    |
| email              | string       | null: false                    |
| encrypted_password | string       | null: false                    |
| last_name          | string       | null: false                    |
| first_name         | string       | null: false                    |
| last_name_kana     | string       | null: false                    |
| first_name_kana    | string       | null: false                    |
| birthday           | date         | null: false                    |

### Association

- has_many :items
- has_many :purchase_managements

## items テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| fee_burden    | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| days_to_ship  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to   :user
- has_many     :purchase_managements

## purchase_managements テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase

## purchases テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| municipality           | string     | null: false                    |
| address                | string     | null: false                    |
| phone_num              | string     | null: false                    |
| purchase_management_id | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_management
