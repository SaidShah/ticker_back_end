class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :house_number, :street_name, :city, :state, :zipcode, :date_of_birth, :username, :email

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_one :account
end
