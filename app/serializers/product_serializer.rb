class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :stock, :category_id
  belongs_to :category
end
