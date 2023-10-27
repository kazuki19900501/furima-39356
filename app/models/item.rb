class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cotegory
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :transit_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :cotegory_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :transit_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, }
  validates :price, numericality: { less_than_or_equal_to: 9999999, }
  validates :price, format: { with: /\A[0-9]+\z/, message: "Price is not a number" }
end
