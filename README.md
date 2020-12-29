# テーブル設計

## users テーブル

| Column             | Type    | Options                                      |
| ------------------ | ------- | -------------------------------------------- |
| nickname           | string  | null: false                                  |
| email              | string  | null: false, unique: true                    |
| encrypted_password | string  | null: false                                  |
| first_name         | string  | null: false                                  |
| last_name          | string  | null: false                                  |
| first_name_kana    | string  | null: false,format: { with: /\p{katakana}/ } |
| last_name_kana     | string  | null: false,format: { with: /\p{katakana}/ } |
| birth_date         | integer | null: false                                  |

### Association

- has_many :items
- has_many :purchase_record

## items テーブル

| Column          | Type       | Options                                      |
| --------------- | ---------- | -------------------------------------------- |
| title           | string     | null: false                                  |
| detail          | text       | null: false                                  |
| price           | references | foreign_key: true                            |
| category        | integer    | null: false                                  |
| condition       | integer    | null: false                                  |
| shipping_payer  | integer    | null: false                                  |
| shipping_source | integer    | null: false                                  |
| storage_date    | integer    | null: false                                  |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_record テーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column          | Type       | Options                                    |
|-----------------|------------|--------------------------------------------|
| postal_code     | string     | null: false,format: { with: /\A[0-9]+\z/ } |
| prefecture      | integer    | null: false                                |
| city            | string     | null: false                                |
| lot_number      | string     | null: false                                |
| building_name   | string     |                                            |
| phone           | string     | null: false,format: { with: /\A[0-9]+\z/ } |
| purchase_record | references | foreign_key: true                          |

### Association

- belongs_to :purchase_record