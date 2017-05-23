# DB設計

## users table

|Column|Type|Options|
|:--|:--|:--|
|name|string|null: false|
|note_id|integer|unique: true|
|avatar|string||

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


### Association
- belongs_to :user

### Index
- add_index :articles, :title
