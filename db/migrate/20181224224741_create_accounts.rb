class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :total_funds
      t.integer :user_id

      t.timestamps
    end
  end
end