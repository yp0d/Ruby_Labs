class CreateLabs < ActiveRecord::Migration[6.1]
  def change
    create_table :labs do |t|
      t.string :title
      t.text :description
      t.string :grade

      t.timestamps
    end
  end
end
