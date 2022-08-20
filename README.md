# アプリケーション名
 FURIMA（フリマアプリ）

# アプリケーション概要
ユーザーを登録すると商品を出品できます。自身が出品した商品は、編集と削除をすることができます。
他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

# URL
https://furima-38253.herokuapp.com/

# テスト用アカウント

- Basic認証

| ID       | pass    |
| -------- | ------- | 
| admin    | 2222    |

- テスト用アカウント

| user     | email    | password     |
| -------- | -------- | ------------ |
| 出品者用  | 1@test   | test1111     |
| 購入者用  | 2@test   | test2222     |

- クレジットカード情報

| 番号               | 期限      | セキュリティコード  |
| ----------------- | -------- | ---------------- |
| 4242424242424242  | 12/44    | 123              |


# データベース設計
![](img/furima.svg)

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


# 開発環境
- フロントエンド

&emsp; HTML, CSS

- バックエンド

&emsp; Ruby on Rails(Ruby)

- インフラ

&emsp; Heroku, AWS(S3)

- OS

&emsp; Mac/Linux

- データベース

&emsp; MySQL

- タスク管理

&emsp; Github
