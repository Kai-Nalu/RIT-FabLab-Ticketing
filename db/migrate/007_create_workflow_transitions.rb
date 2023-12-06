class CreateWorkflowTransitions < ActiveRecord::Migration[7.0]
  def change
    create_table :workflow_transitions do |t|
      t.integer :initial_status_id
      t.references :workflow_transition_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
