class CreateMachines < ActiveRecord::Migration[7.0]
  def change
    create_table :machines do |t|
      t.string :name
      t.float :time_cost

      t.references :m_process, null: false, foreign_key: true

      t.timestamps
    end
  end
end
