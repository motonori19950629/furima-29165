# テーブル設計

## users テーブル

| Column            | Type   | Option      | 
| ----------------- | ------ | ----------- | 
| nickname          | string | null: false | 
| email             | string | null: false | 
| password          | string | null: false | 
| kanji_family_name | string | null: false | 
| kanji_first_name  | string | null: false | 
| kana_family_name  | string | null: false | 
| kana_first_name   | string | null: false | 
| birthday          | date   | null: false | 

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type      | Options                        | 
| ---------------- | --------- | ------------------------------ | 
| name             | string    | null: false                    | 
| price            | integer   | null: false                    | 
| user             | reference | null: false, foreign_key: true | 
| detail           | text      | null: false                    | 
| category_id      | integer   | null: false                    | 
| status_id        | integer   | null: false                    | 
| delivery_fee_id  | integer   | null: false                    | 
| place_from_id    | integer   | null: false                    | 
| date_shipment_id | integer   | null: false                    | 

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| item    | references | null: false, foreign_key: true | 
| user    | references | null: false, foreign_key: true | 

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| purchase       | references | null: false, foreign_key: true | 
| postal_code    | string     | null: false                    | 
| prefecture_id  | integer    | null: false                    | 
| city           | string     | null: false                    | 
| street_address | string     | null: false                    | 
| building       | string     |                                | 
| phone_number   | string     | null: false                    | 

### Association

- belongs_to :purchase
