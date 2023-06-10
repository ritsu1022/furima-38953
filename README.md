# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
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
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| shipping_fee       | integer    | null: false                     |
| region_id          | integer    | null: false                     |
| lead_time_id       | integer    | null: false                     |
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

## historiesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item


## ordersテーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| zip                | string     | null: false                     |
| region_id          | integer    | null: false                     |
| municipalities     | string     | null: false                     |
| house_number       | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to : user
- belongs_to : item