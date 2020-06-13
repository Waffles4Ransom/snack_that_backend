class CreateSnacks < ActiveRecord::Migration[6.0]
  def change
    create_table :snacks do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :origin
      t.string :categories, array: true
      t.string :status

      t.timestamps
    end
  end
end
