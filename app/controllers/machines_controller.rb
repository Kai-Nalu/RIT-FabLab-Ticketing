class MachinesController < ApplicationController
	layout "settings"

	before_action :machine_init

	def index
		@machines = Machine.all
	end

	def new
		@machine = Machine.new
	end

	def create
		@machine = Machine.new(machine_params)

		if @machine.save
      		redirect_to machines_settings_path
    	else
      		render :new, status: :unprocessable_entity
    	end
	end

	def edit
		@machine = Machine.find(params[:id])
	end

	def update
		@machine = Machine.find(params[:id])

		if @machine.update(machine_params)
    	  redirect_to machines_settings_path
    	else
    	  render :edit, status: :unprocessable_entity
    	end
	end

	def destroy
		@machine = Machine.find(params[:id])
		@machine.destroy

		redirect_to machines_settings_path, status: :see_other
	end

	private
		def machine_params
			params.require(:machine).permit(
				:name,
			    :m_process_id
			)
		end

		def machine_init
			@m_processes = MProcess.all
			if params[:m_process_id]
				@m_process = MProcess.find_by_id(params[:m_process_id])
			end
			if params[:id]
				@m_process = Machine.find_by_id(params[:id]).m_process
			end
		end
end
