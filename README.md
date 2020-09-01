# テーブル設計

## users テーブル

| Column            | Type   | Option      | 
| ----------------- | ------ | ----------- | 
| nickname          | string | null: false | 
| email              | string | null: false | 
| password          | string | null: false | 
| kanji_family_name | string | null: false | 
| kanji_first_name  | string | null: false | 
| kana_family_name  | string | null: false | 
| kana_first_name   | string | null: false | 
| birthday          | string | null: false | 

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type      | Options                        | 
| ------------- | --------- | ------------------------------ | 
| name          | string    | null: false                    | 
| price         | integer   | null: false                    | 
| user          | reference | null: false, foreign_key: true | 
| category      | string    | null: false                    | 
| status        | string    | null: false                    | 
| delivery_fee  | string    | null: false                    | 
| place_from    | string    | null: false                    | 
| date_shipment | string    | null: false                    | 

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| item    | references | null: false, foreign_key: true | 
| user    | references | null: false, foreign_key: true | 
| address | references | null: false, foreign_key: true | 

### Association

- belongs_to :item
- belongs_to :user
- belongs_one :address

## address テーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| purchase       | references | null: false, foreign_key: true | 
| postal_code    | string     | null: false                    | 
| prefecture_id  | integer    | null: false                    | 
| city_id        | integer    | null: false                    | 
| street_address | text       | null: false                    | 
| building       | text       | null: false                    | 
| phone_number   | string     | null: false                    | 

### Association

- belongs_to :purchase
