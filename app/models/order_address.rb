class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :token
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end