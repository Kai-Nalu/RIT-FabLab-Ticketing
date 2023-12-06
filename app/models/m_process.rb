class MProcess < ApplicationRecord
	has_many :machines
	has_many :materials
	has_one :workflow
end
