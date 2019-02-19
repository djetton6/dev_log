class CreateDeveloperEthos < ActiveRecord::Migration[5.2]
  def change
    create_table :developer_ethos do |t|
      t.text :step
      t.belongs_to :developer, foreign_key: true

      t.timestamps
    end
  end
end
