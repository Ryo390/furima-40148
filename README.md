# テーブル設計


## Usersテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
|nickname           |string     |null: false                   | ニックネーム
|birthday           |date       |null: false                   | 生年月日
|email              |string     |null: false, unique: true     | メールアドレス
|encrypted_password |string     |null: false                   | パスワード
|last_name_zen      |string     |null: false                   | 名前全角
|first_name_zen     |string     |null: false                   | 苗字全角
|last_name_kana     |string     |null: false                   | 名前カタカナ
|first_name_kana    |string     |null: false                   | 苗字カタカナ

### Association

- has_many :purchases_records
- has_many :items


## Itemsテーブル

|Column               |Type       |Options                       |
|---------------------|-----------|------------------------------|
|item_name            |string     |null: false                   | 商品名
|price                |integer    |null: false                   | 販売価格
|description_item     |string     |null: false                   | 商品説明
|item_details         |genre_id   |null: false                   | 商品詳細
|shipping_information |genre_id   |null: false                   | 配送情報
|user                 |references |null: false, foreign_key: true|
|item                 |references |null: false, foreign_key: true|
|sipping_address      |references |null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchas_record
- has_one :shipping_address


## Purchas_recordsテーブル

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|user          |references |null: false, foreign_key: true| 誰が
|item          |references |null: false, foreign_key: true| どの商品を購入したか

### Association
- belongs_to :user
- has_one :item
- has_one :shipping_address


## Shipping_addressesテーブル

|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
|post_code       |string     |null: false                   | 郵便番号
|prefectures     |genre_id   |null: false                   | 都道府県
|municipalities  |string     |null: false                   | 市区町村
|street_address  |string     |null: false                   | 住所
|building_name   |string     |                              | 建物名
|phonenumber     |string     |null: false                   | 電話番号
|purchas_record  |references |null: false, foreign_key: true|

### Association
- has_one :item
- has_one :purchas_record