class CreatePhotographers < ActiveRecord::Migration[6.0]
  def change
    create_table :photographers do |t|
      t.string :name
      t.string :website
      t.integer :years_of_experience
      t.string :city
      t.string :state
      t.string :image
      t.timestamps
    end
  end
end
