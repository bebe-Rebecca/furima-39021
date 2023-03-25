class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :origin_to_prefecture
  belongs_to :days_to_ship

  validates :name,                    presence: true
  validates :description,             presence: true
  validates :category_id,             presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,            presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :origin_to_prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image,                   presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
