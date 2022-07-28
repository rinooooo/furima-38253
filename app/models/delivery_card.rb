class DeliveryCard
  include ActiveModel::Model
    attr_accessor :post_code, :delivery_area_id, :town, :address, :house_name, :phone_number, :card_number, :card_date_month, :card_date_year, :card_security, :order_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :town
    validates :address
    validates :phone_number
    validates :card_number
    validates :card_date_month
    validates :caed_date_year
    validates :card_security
  end
  validates :delivery_area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    delivery = Delivery.create(post_code: post_code, delivery_area_id: delivery_area_id, town: town, address: address, house_name: house_name, phone_number: phone_number)
    Card.create(card_number: card_number, card_date: card_date, card_security: card_security)
  end

end