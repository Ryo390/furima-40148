class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :nationwide

  validates :item_name
  validates :price
  validates :description_item
  validates :category_id
  validates :item_condition_id
  validates :prefecture_id
  validates :postage_id
  validates :delivery_date_id
  validates :user

  # belongs_to :user
  # has_one :purchas_record
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :nationwide
  belongs_to :delivery
  has_one_attached :image

  validates :title, :text, presence: true
  validates :nationwide_id, numericality: { other_than: 1 , message: "can't be blank"}
end
