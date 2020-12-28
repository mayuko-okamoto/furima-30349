# テーブル設計

## users テーブル

| Column          | Type   | Options                                      |
| --------------- | ------ | -------------------------------------------- |
| nickname        | string | null: false                                  |
| email           | string | null: false, unique: true                    |
| password        | string | null: false                                  |
| first_name      | string | null: false                                  |
| last_name       | string | null: false                                  |
| first_name_kana | string | null: false,format: { with: /\p{katakana}/ } |
| last_name_kana  | string | null: false,format: { with: /\p{katakana}/ } |

### Association

- has_many :items
- has_many :purchase_record

## items テーブル

| Column      | Type       | Options                                      |
| ----------- | ---------- | -------------------------------------------- |
| title       | string     | null: false                                  |
| detail      | text       | null: false                                  |
| price       | string     | null: false, inclusion: { in: 300..9999999 } |
| user        | references | foreign_key: true                            |

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
| postal_code     | text       | null: false,format: { with: /\A[0-9]+\z/ } |
| city            | text       | null: false                                |
| lot_number      | text       | null: false                                |
| building_name   | text       | null: false                                |
| phone           | text       | null: false,format: { with: /\A[0-9]+\z/ } |
| purchase_record | references | foreign_key: true                          |

### Association

- belongs_to :purchase_record