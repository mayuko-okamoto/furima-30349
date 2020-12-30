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
| birth_date         | date    | null: false                                  |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column            | Type       | Options                                      |
| ----------------- | ---------- | -------------------------------------------- |
| title             | string     | null: false                                  |
| detail            | text       | null: false                                  |
| price             | integer    | null: false, inclusion: { in: 300..9999999 } |
| category_id       | integer    | null: false                                  |
| condition_id      | integer    | null: false                                  |
| shipping_payer_id | integer    | null: false                                  |
| prefecture_id     | integer    | null: false                                  |
| storage_date_id   | integer    | null: false                                  |
| user              | references | foreign_key: true                            |

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
| prefecture_id   | integer    | null: false                                |
| city            | string     | null: false                                |
| lot_number      | string     | null: false                                |
| building_name   | string     |                                            |
| phone           | string     | null: false,format: { with: /\A[0-9]+\z/ } |
| purchase_record | references | foreign_key: true                          |

### Association

- belongs_to :purchase_record