class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :house_number
      t.string :city
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
