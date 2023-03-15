# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| name                 | string    | null: false                    |
| description          | string    | null: false                    |
| category             | string    | null: false                    |
| condition            | string    | null: false                    |
| shipping_fee_burden  | string    | null: false                    |
| origin_to_prefecture | string    | null: false                    |
| days_to_ship         | string    | null: false                    |
| price                | integer   | null: false                    |
| seller               | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_to :prototype

## purchases テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| item   | reference | null: false, foreign_key: true |
| buyer  | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_to :shipping_address

## shipping_addresses テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_code    | integer   | null: false                    |
| prefecture     | string    | null: false                    |
| city           | string    | null: false                    |
| address_number | integer   | null: false                    |
| building_name  | string    | null: false                    |
| phone_number   | integer   | null: false                    |
| user           | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase
