class CreateWorkflows < ActiveRecord::Migration[7.0]
  def change
    create_table :workflows do |t|
      t.integer :default_status_id
      t.references :m_process, null: false, foreign_key: true

      t.timestamps
    end
  end
end
