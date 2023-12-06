class MProcessesController < ApplicationController
	layout "settings"

	def index
		@m_processes = MProcess.all
		@statuses = Status.all
	end

	def new
		@m_process = MProcess.new
	end

	def create
		@m_process = MProcess.new(m_process_params)
		if Status.all.empty?
			default_status = 1
		else
			default_status = Status.first.id
		end
		@workflow = @m_process.build_workflow(default_status_id: default_status)

		if @m_process.save
      		redirect_to m_processes_settings_path
    	else
      		render :new, status: :unprocessable_entity
    	end
	end

	def edit
		@m_process = MProcess.find(params[:id])
	end

	def update
		@m_process = MProcess.find(params[:id])

		if @m_process.update(m_process_params)
    	  redirect_to m_processes_settings_path
    	else
    	  render :edit, status: :unprocessable_entity
    	end
	end

	def destroy
		@m_process = MProcess.find(params[:id])
		@m_process.destroy

		redirect_to m_processes_settings_path, status: :see_other
	end

	private
		def m_process_params
			params.require(:m_process).permit(
				:name,
			    :is_active,
			    :units,
			    :time_cost
			)
		end
end
