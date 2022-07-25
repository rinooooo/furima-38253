# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :delivery



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| delivery_charge  | integer    | null: false                    |
| delivery_area    | string     | null: false                    |
| delivery_days    | integer    | null: false                    |
| item_price       | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_one    :delivery

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery


## delivery テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| card_date        | date       | null: false                    |
| card_security    | integer    | null: false                    |
| post_code        | integer    | null: false                    |
| country          | string     | null: false                    |
| town             | string     | null: false                    |
| address          | integer    | null: false                    |
| house_name       | string     |                                |
| phone_number     | integer    | null: false                    |
| order_id         | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- belongs_to :item
