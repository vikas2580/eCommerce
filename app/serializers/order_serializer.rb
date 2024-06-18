class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :total_price, :user_id
  belongs_to :user
  has_many :order_items
end
