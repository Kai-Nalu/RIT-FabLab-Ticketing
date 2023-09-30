class Status < ApplicationRecord
	default_scope { order('position ASC') }
end
