class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  validates :description_item, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :postage_id, presence: true
  validates :delivery_date_id, presence: true
  validates :image, presence: true
  # validates :user, presence: true

  belongs_to :user
  # has_one :purchas_record
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_date
  has_one_attached :image

  validates :item_name, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
