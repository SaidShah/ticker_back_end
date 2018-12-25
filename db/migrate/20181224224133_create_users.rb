class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :house_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :date_of_birth

      t.timestamps
    end
  end
end
