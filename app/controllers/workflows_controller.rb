class WorkflowsController < ApplicationController
	layout "settings"

	before_action :workflow_init

	def index
		@workflows = Workflow.all
	end

	def edit
		@workflow = Workflow.find(params[:id])
		@workflow_form = WorkflowForm.new
		@workflow_form.initialize_form(@workflow)
	end

	def update
		@workflow_form = WorkflowForm.new

		if @workflow_form.update(workflow_params)
    	  redirect_to workflows_settings_path
    	else
    	  render :edit, status: :unprocessable_entity
    	end
	end

	def destroy
		@workflow = Workflow.find(params[:id])
		@workflow.destroy

		redirect_to workflows_settings_path, status: :see_other
	end

	private
		def workflow_params
			params.require(:workflow_form).permit(
				:id,
				:default_status_id,
			    :m_process_id,
			    workflow_transition_groups_attributes: [
			    	:id,
					:name,
					:target_status_id,
					:_destroy,
					initial_status_ids: []
			    ]
			)
		end

		def workflow_init
			@m_processes = MProcess.all
			@statuses = Status.all
			if params[:m_process_id]
				@m_process = MProcess.find_by_id(params[:m_process_id])
			end
			if params[:id]
				@m_process = Workflow.find_by_id(params[:id]).m_process
			end
		end
end
