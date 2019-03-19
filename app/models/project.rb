class Project < ApplicationRecord
	has_many :bugs
	has_many :assignments
	has_many :users, through: :assignments
end
