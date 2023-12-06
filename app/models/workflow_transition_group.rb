class WorkflowTransitionGroup < ApplicationRecord
	belongs_to :workflow

	has_many :workflow_transitions, dependent: :destroy

	# attr_accessor :initial_status_ids
	# attr_accessor :target_status_id

	# after_initialize :make_initial_ids

	# def make_initial_ids
	# 	@target_status_id = Array.new
	# end
end
