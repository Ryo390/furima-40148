# テーブル設計


## Usersテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
|nickname           |string     |null: false                   |
|birthday           |date       |null: false                   |
|email              |string     |null: false, unique: true     |
|encrypted_password |string     |null: false                   |
|last_name_zen      |string     |null: false                   |
|first_name_zen     |string     |null: false                   |
|last_name_kana     |string     |null: false                   |
|first_name_kana    |string     |null: false                   |

### Association

- has_many :purchases_record
- has_many :items


## Itemsテーブル

|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
|item_name       |string     |null: false                   |
|price           |integer    |null: false                   |
|postage         |integer    |null: false                   |
|category        |string     |null: false                   |
|seller          |string     |null: false                   |
|delivery_time   |string     |null: false                   |
|item_condition  |string     |null: false                   |
|shipping_source |string     |null: false                   |
|user_id         |references |null: false, foreign_key: true|
|item_id         |references |null: false, foreign_key: true|
|genre_id        |integer    |null: false                   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## Purchas_recordテーブル

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|item_name     |string     |null: false                   |
|customer_name |string     |null: false                   |
|user_id       |references |null: false, foreign_key: true|
|item_id       |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :items


## Shipping_addressテーブル

|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
|post_code       |string     |null: false                   |
|prefectures     |string     |null: false                   |
|municipalities  |string     |null: false                   |
|street_address  |string     |null: false                   |
|building_name   |string     |                              |
|phonenumber     |string     |null: false                   |
|item_id         |references |null: false, foreign_key: true|

### Association
- has_one :item