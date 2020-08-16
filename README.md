# README

## users table​
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null:false|
|email|string|null:false|
|image|string|

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post

## posts table
|Column|Type|Options|
|------|----|-------|
|content|string|null:text|
|user|references|null:fales|foreign_key: true|

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :liked_users, through: :likes, source: :user



## comment table
|Column|Type|Options|
|------|----|-------|
|content|string|null:false|
|user_id|references|null:false|
|post_id|references|null: false|

### Association
- belongs_to :user
- belongs_to :post

## likes table
|Likes|Type|Options|
|------|----|-------|
|user_id|references|null:false|
|post_id|references|null: false|

### Association
- belongs_to :post
- belongs_to :user
- validates_uniqueness_of :post_id, scope: :user_id

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
