class WorkflowForm
	include ActiveModel::Model

	# Specify allowed parameters
	attr_accessor :id, :default_status_id, :m_process_id, :workflow_transition_groups_attributes

	## Validations
	# validates :name, presence: true

	# Initialize form method
	def initialize_form(workflow)
		# Validate input
		return false unless workflow.is_a? Workflow

		# Get all attributes
		wtgs_attributes = []
		workflow.workflow_transition_groups.each do |workflow_transition_group|
			attributes_hash = {
				id: workflow_transition_group.id,
				name: workflow_transition_group.name,
				target_status_id: workflow_transition_group.target_status_id
			}
			initial_status_ids = []
			workflow_transition_group.workflow_transitions.each do |workflow_transition|
				initial_status_ids.push(workflow_transition.initial_status_id)
			end
			attributes_hash[:initial_status_ids] = initial_status_ids
			wtgs_attributes.push(attributes_hash)
		end

		assign_attributes(id: workflow.id, default_status_id: workflow.default_status_id, m_process_id: workflow.m_process_id, workflow_transition_groups_attributes: wtgs_attributes)
	end

	# Update method
	def update(attributes)
		# Validate attributes
		assign_attributes(attributes)
		valid?
		return false unless valid?

		# Update workflow model
		workflow = Workflow.find_by_id(id)
		workflow.update(default_status_id: default_status_id, m_process_id: m_process_id)

		# Update and create workflow transition group models
		workflow_transition_groups_attributes.each do |workflow_transition_group_attributes|
			unless workflow_transition_group_attributes[:id].blank?
				workflow_transition_group = WorkflowTransitionGroup.find_by_id(workflow_transition_group_attributes[:id])
				unless workflow_transition_group_attributes[:_destroy] == "true"
					workflow_transition_group.update(workflow_transition_group_attributes.except(:initial_status_ids, :id, :_destroy))
				else
					workflow_transition_group.destroy
					next
				end
			else
				unless workflow_transition_group_attributes[:_destroy] == "true"
					workflow_transition_group = WorkflowTransitionGroup.create(workflow_transition_group_attributes.except(:initial_status_ids, :_destroy).merge(workflow_id: workflow.id))
				else
					next
				end
			end

			workflow_transition_group_id = workflow_transition_group.id

			# Delete and create workflow transition models
			workflow_transition_group.workflow_transitions.destroy_all
			workflow_transition_group_attributes.fetch(:initial_status_ids, []).each do |initial_status_id|
				WorkflowTransition.create(workflow_transition_group_id: workflow_transition_group_id, initial_status_id: initial_status_id)
			end
		end
	end
end