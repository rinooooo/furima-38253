class DeliveryCard
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :town, :address, :house_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :town
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. exclude hyphen(-)' }
  end
  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, delivery_area_id: delivery_area_id, town: town, address: address,
                    house_name: house_name, phone_number: phone_number, order_id: order.id)
  end
end
