class Item < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :item_price, presence: true



end
