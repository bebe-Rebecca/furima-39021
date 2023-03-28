class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :origin_to_prefecture_id, :city, :address_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number'}
  end
  validates :origin_to_prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, origin_to_prefecture_id: origin_to_prefecture_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end