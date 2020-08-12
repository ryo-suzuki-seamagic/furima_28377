# テーブル設計

## usersテーブル

|  Column     |  Type      |  Options      |
| ----------- | ---------- | ------------- |
|  name       |  string    |  null: false  |
|  email      |  string    |  null: false  |
| password    |  stling    |  null: false  |
| birthday    |  integer   |  null: false  |
| first-name  |  string    |  null: false  |
| family-name |  string    |  null: false  |


### Association

- has_many :items
- has_many :comments
- has_many :purchases




## itemsテーブル

|  Column     |  Type      |  Options                       |
|-------------|------------|------------------------------- |
|  image      |  string    |  null: false                   |
|  title      |  string    |  null: false                   |
|  text       |  text      |  null: false                   |
|  money      |  integer   |  null: false                   |
|  user       |  references|  null: false  foreign_key: ture|
|  fee        |  integer   |  null: false                   |
|  profit     |  integer   |  null: false                   |

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



## purchasessテーブル

|  Column     |  Type      |  Options                        |
|-------------|------------|---------------------------------|
|  address    |  text      |  null: false                    |
|  user       |  references|  null: false,  foreign_key: ture|
|  item       |  references|  null: false,  foreign_key: ture|

### Association
- belongs_to :user
- belongs_to :item 