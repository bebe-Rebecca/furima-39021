class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,                    presence: true
  validates :description,             presence: true
  validates :category_id,             presence: true
  validates :condition_id,            presence: true
  validates :shipping_fee_burden_id,  presence: true
  validates :origin_to_prefecture_id, presence: true
  validates :days_to_ship_id,         presence: true
  validates :price,                   presence: true
  validates :image,                   presence: true  
end
