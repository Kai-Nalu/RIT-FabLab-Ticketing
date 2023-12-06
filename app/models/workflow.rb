class Workflow < ApplicationRecord
	belongs_to :m_process
	has_many :workflow_transition_groups
	accepts_nested_attributes_for :workflow_transition_groups, reject_if: :all_blank, allow_destroy: true
end
