class CreateWorkflowTransitionGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :workflow_transition_groups do |t|
      t.string :name
      t.integer :target_status_id
      t.references :workflow, null: false, foreign_key: true

      t.timestamps
    end
  end
end
