# テーブル設計

## users テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| nickname        | string       | null: false                    |
| email           | string       | null: false                    |
| password        | string       | null: false                    |
| last_name       | string       | null: false                    |
| first_name      | string       | null: false                    |
| last_name_kana  | string       | null: false                    |
| first_name_kana | string       | null: false                    |
| birthday        | date         | null: false                    |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| fee_burden   | string     | null: false                    |
| days_to_ship | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_one     :purchases

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_num        | string     | null: false                    |
| expiration_date | date       | null: false                    |
| security_code   | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_num       | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item