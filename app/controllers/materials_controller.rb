class MaterialsController < ApplicationController
	layout "settings"

	before_action :material_init

	def index
		@materials = Material.all
	end

	def new
		@material = Material.new
	end

	def create
		@material = Material.new(material_params)

		if @material.save
      		redirect_to materials_settings_path
    	else
      		render :new, status: :unprocessable_entity
    	end
	end

	def edit
		@material = Material.find(params[:id])
	end

	def update
		@material = Material.find(params[:id])

		if @material.update(material_params)
    	  redirect_to materials_settings_path
    	else
    	  render :edit, status: :unprocessable_entity
    	end
	end

	def destroy
		@material = Material.find(params[:id])
		@material.destroy

		redirect_to materials_settings_path, status: :see_other
	end

	private
		def material_params
			params.require(:material).permit(
				:name,
				:in_stock,
				:units,
				:quantity_cost,
			    :m_process_id
			)
		end

		def material_init
			@m_processes = MProcess.all
			if params[:m_process_id]
				@m_process = MProcess.find_by_id(params[:m_process_id])
			end
			if params[:id]
				@m_process = Material.find_by_id(params[:id]).m_process
			end
		end
end
