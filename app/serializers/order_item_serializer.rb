class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id, :quantity, :price
  belongs_to :order
  belongs_to :product
end
