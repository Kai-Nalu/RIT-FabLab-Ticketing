class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.boolean :in_stock
      t.decimal :quantity_cost

      t.references :m_process, null: false, foreign_key: true

      t.timestamps
    end
  end
end
