# DB設計

## users table

|Column|Type|Options|
|:--|:--|:--|
|nickname|string|null: false|
|note_id|integer|unique: true|
|avatar|string||
|head_image|string||
|profile|string||

### Association
- has_many :articles

### Index
- add_index :users, :name

## articles table

|Column|Type|Options|
|:--|:--|:--|
|title|string|null: false|
|body|text|null: false|
|image|string||
|price|integer||
|author_id|integer|foreign_key: true|

### Association
- belongs_to :user
- has_many :users, through: :purchases

### Index
- add_index :articles, :title

## purchases_table

|Column|Type|Options|
|:--|:--|:--|
|buyer_id|integer|foreign_key: true|
|seller_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article
