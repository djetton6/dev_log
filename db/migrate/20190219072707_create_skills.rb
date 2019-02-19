class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.belongs_to_ :developer

      t.timestamps
    end
  end
end
