class StockSerializer < ActiveModel::Serializer
  attributes :id, :total_quantity, :total_value, :purchase_price

  has_many :user_stocks
  has_many :users, through: :user_stocks
end
