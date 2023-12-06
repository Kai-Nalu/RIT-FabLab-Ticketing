class WorkflowTransitionGroupTransitionGroupsController < ApplicationController
	layout "settings"

	before_action :workflow_transition_group_init

	def index
		@workflow_transition_groups = WorkflowTransitionGroup.all
	end

	def new
		@workflow_transition_group = WorkflowTransitionGroup.new
	end

	def create
		@workflow_transition_group = WorkflowTransitionGroup.new(workflow_transition_group_params)

		if @workflow_transition_group.save
      		redirect_to workflow_transition_groups_settings_path
    	else
      		render :new, status: :unprocessable_entity
    	end
	end

	def edit
		@workflow_transition_group = WorkflowTransitionGroup.find(params[:id])
	end

	def update
		@workflow_transition_group = WorkflowTransitionGroup.find(params[:id])

		if @workflow_transition_group.update(workflow_transition_group_params)
    	  redirect_to workflow_transition_groups_settings_path
    	else
    	  render :edit, status: :unprocessable_entity
    	end
	end

	def destroy
		@workflow_transition_group = WorkflowTransitionGroup.find(params[:id])
		@workflow_transition_group.destroy

		redirect_to workflow_transition_groups_settings_path, status: :see_other
	end

	private
		def workflow_transition_group_params
			params.require(:workflow_transition_group).permit(
				:name,
			    :workflow_id
			)
		end

		def workflow_transition_group_init
			@m_processes = MProcess.all
			@statuses = Status.all
			if params[:m_process_id]
				@m_process = MProcess.find_by_id(params[:m_process_id])
			end
			if params[:id]
				@m_process = WorkflowTransitionGroup.find_by_id(params[:id]).m_process
			end
		end
end
