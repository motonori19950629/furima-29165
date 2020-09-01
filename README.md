# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

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

| column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| item_id        | references | null: false, foreign_key: true | 
| user_ud        | references | null: false, foreign_key: true | 
| postal_code    | string     | null: false                    | 
| prefecture     | text       | null: false                    | 
| city           | text       | null: false                    | 
| street_address | text       | null: false                    | 
| building       | text       | null: false                    | 
| phone_number   | string     | null: false                    | 

### Association

- belongs_to :item
- belongs_to :user
