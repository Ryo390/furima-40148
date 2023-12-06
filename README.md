# テーブル設計


## Usersテーブル

|Column       |Type       |Options                       |
|-------------|-----------|------------------------------|
|nickname     |string     |null: false                   |
|date         |integer    |null: false                   |
|email        |string     |null: false                   |
|phone_number |integer    |null: false                   |
|post_code    |integer    |null: false                   |
|prefectures  |string     |null: false                   |
|address      |string     |null: false                   |
|password     |integer    |null: false                   |

### Association

- has_many : purchas_record
- has_many : items


## Itemsテーブル

|Column       |Type       |Options                       |
|-------------|-----------|------------------------------|
|item_name    |string     |null: false                   |
|image        |string     |null: false                   |
|price        |integer    |null: false                   |
|postage      |integer    |null: false                   |
|category     |string     |null: false                   |
|seller       |string     |null: false                   |

### Association

- belongs_to : users
- has_one : shipping_address


## Purchas_recordテーブル

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|item_name     |string     |null: false                   |
|image         |string     |null: false                   |
|price         |integer    |null: false                   |
|postage       |integer    |null: false                   |
|seller        |string     |null: false                   |
|customer_name |string     |null: false                   |

### Association
- belongs_to : users
- has_one : shipping_address


## Shipping_addressテーブル

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|customer_name |string     |null: false                   |
|phone_number  |string     |null: false                   |
|post_code     |integer    |null: false                   |
|prefectures   |integer    |null: false                   |
|address       |string     |null: false                   |

### Association

- has_one : items
- has one : purchas_record