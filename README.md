# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many   :items
- has_many   :comments
- has_many   :orders


## itemsテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| explanation        | text       | null: false                     |
| category           | string     | null: false                     |
| condition          | string     | null: false                     |
| shipping_fee       | integer    | null: false                     |
| region             | string     | null: false                     |
| lead_time          | string     | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to : user
- has_many   : comments
- has_one    : order


## commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item


## ordersテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| zip                | string     | null: false                     |
| prefecture         | string     | null: false                     |
| municipalities     | string     | null: false                     |
| house_number       | string     | null: false                     |
| building_name      | string     | null: false                     |
| phone_number       | string     | null: false, unique: true       |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to : user
- belongs_to : item