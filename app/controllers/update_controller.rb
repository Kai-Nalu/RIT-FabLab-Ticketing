class UpdateController < ApplicationController
	def sortable_table
		first_param_key = params.keys[0]
		model = first_param_key.camelize.constantize
		formatted_models = {}
		params[first_param_key].each_with_index do |record_id, index|
			formatted_models.store(record_id, {'id' => record_id})
			formatted_models.store(record_id, {'position' => (index + 1)})
		end
		if model.update(formatted_models.keys, formatted_models.values)
			head :no_content
		else
			head :internal_server_error
		end
	end
end
