# README

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| description     | string  | null: false |
| cotegory        | string  | null: false |
| condition       | string  | null: false |
| delivery_charge | string  | null: false |
| prefecture_id   | string  | null: false |
| transit_day     | integer | null: false |
| price           | integer | null: false |

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options           |
| -------| ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :shipping address

## shipping address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | integer | null: false |
| prefecture_id | string  | null: false |
| city          | string  | null: false |
| block         | string  | null: false |
| building      | string  | null: false |
| phone_number  | integer | null: false |

- belongs_to :order