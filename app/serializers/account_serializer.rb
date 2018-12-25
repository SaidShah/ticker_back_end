class AccountSerializer < ActiveModel::Serializer
  attributes :id, :total_funds

  belongs_to :user
end
