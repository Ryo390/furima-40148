class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :nationwide

  validates :item_name, presence: true
  validates :price, presence: true
  validates :description_item, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :postage_id, presence: true
  validates :delivery_date_id, presence: true
  validates :user, presence: true

  # belongs_to :user
  # has_one :purchas_record
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefectur
  belongs_to :delivery
  has_one_attached :image

  validates :title, :text, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
end
