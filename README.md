# usersテーブル

|  Column     |  Type      |  Options      |
| ----------- | ---------- | ------------- |
|  name       |  string    |  null: false  |
|  email      |  string    |  null: false  |
| password    |  stling    |  null: false  |

### Association
- has_one :profil
- has_many :items
- has_many :comments

# profilsテーブル

|  Column     |  Type      |  Options     |
|-------------|------------|--------------|
| birthday    |  integer   |  null: false |
| first-name  |  string    |  null: false |
| family-name |  string    |  null: false |

### Association
- belongs_to :user

# itemsテーブル

|  Column     |  Type      |  Options                       |
|-------------|------------|------------------------------- |
|  image      |  string    |  null: false                   |
|  title      |  string    |  null: false                   |
|  text       |  text      |  null: false                   |
|  money      |  integer   |  null: false                   |
|  user-id    |  references|  null: false  foreign_key: ture|

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase

# commentsテーブル

|  Column     |  Type      |  Options                        |
|-------------|------------|---------------------------------|
|  text       |  text      |  null: false                    |
|  user-id    |  references|  null: false,  foreign_key: ture|
|  item-id    |  references|  null: false,  foreign_key: ture|

### Association
- belongs_to :user
- belongs_to :item

# purchasesテーブル

|  Column       |  Type      |  Options     |
|---------------|------------|--------------|
|  user         |  string    |  null: false |
|  address      |  text      |  null: false |
|  phone-number |  integer   |  null: false |

### Association

- belongs_to :item