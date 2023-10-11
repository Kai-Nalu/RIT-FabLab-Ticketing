class CreateMProcesses < ActiveRecord::Migration[7.0]
  def change
    create_table :m_processes do |t|
      t.string :name
      t.boolean :is_active
      t.string :units
      t.decimal :time_cost

      t.timestamps
    end
  end
end
