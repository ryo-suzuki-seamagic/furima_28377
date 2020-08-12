# テーブル設計

## usersテーブル

|  Column          |  Type      |  Options      |
| ---------------- | ---------- | ------------- |
|  name            |  string    |  null: false  |
|  email           |  string    |  null: false  |
| password         |  stling    |  null: false  |
| birthday         |  integer   |  null: false  |
| first-name       |  string    |  null: false  |
| family-name      |  string    |  null: false  |
| first-name-kana  |  string    |  null: false  |
| family-name-kana |  string    |  null: false  |



### Association

- has_many :items
- has_many :comments
- has_many :purchases




## itemsテーブル

|  Column           |  Type      |  Options                       |
|-------------------|------------|------------------------------- |
|  image            |  string    |  null: false                   |
|  title            |  string    |  null: false                   |
|  text             |  text      |  null: false                   |
|  kategory-id      |  integer   |  null: false                   |
|  status-id        |  integer   |  null: false                   |
|  delivery-fee-id  |  integer   |  null: false                   |
|  from-id          |  integer   |  null: false                   |
|  days-id          |  integer   |  null: false                   |
|  price            |  integer   |  null: false                   |
|  user             |  references|  null: false  foreign_key: ture|

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase

## commentsテーブル

|  Column     |  Type      |  Options                        |
|-------------|------------|---------------------------------|
|  text       |  text      |  null: false                    |
|  user       |  references|  null: false,  foreign_key: ture|
|  item       |  references|  null: false,  foreign_key: ture|

### Association
- belongs_to :user
- belongs_to :item



## purchasesテーブル

|  Column     |  Type      |  Options                        |
|-------------|------------|---------------------------------|
|  user       |  references|  null: false,  foreign_key: ture|
|  item       |  references|  null: false,  foreign_key: ture|

### Association
- belongs_to :user
- belongs_to :item 
- has_one :address

## addressesテーブル


|  Column         |  Type      |  Options                        |
|-----------------|------------|---------------------------------|
|  postal-code    |  text      |  null: false                    |
|  purchase-id    |  integer   |  null: false                    |
|  muncipalities  |  integer   |  null: false                    |
|  address        |  integer   |  null: false                    |
|  building-name  |  integer   |  null: ture                     |
|  phone-number   |  string    |  null: false                    |


### Association
- belongs_to :purchase