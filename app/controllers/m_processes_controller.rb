class MProcessesController < ApplicationController
	def index
		@m_processes = MProcess.all
	end

	def new
		@m_process = MProcess.new
	end

	def create
		@m_process = MProcess.new(m_process_params)

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
			    :is_active
			)
		end
end
