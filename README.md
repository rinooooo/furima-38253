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



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order



## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery
- has_one    :card




## delivery テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| delivery_area_id  | integer    | null: false                    |
| town              | string     | null: false                    |
| address           | string     | null: false                    |
| house_name        | string     |                                |
| phone_number      | integer    | null: false                    |
| order             | references | null: false, foreign_key: true |


### Association

- belongs_to :order


## cards テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_number       | integer    | null: false                    |
| card_date_month   | integer    | null: false                    |
| card_date_year    | integer    | null: false                    |
| card_security     | integer    | null: false                    |
| order             | references | null: false, foreign_key: true |


### Association

- belongs_to :order
