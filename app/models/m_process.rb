class MProcess < ApplicationRecord
	has_many :machines
	has_many :materials
end
