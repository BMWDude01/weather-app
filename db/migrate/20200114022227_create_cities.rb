class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.belongs_to :user

      t.timestamps
    end
  end
end
