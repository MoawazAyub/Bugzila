class Bug < ApplicationRecord
	belongs_to :project
	belongs_to :founder, :class_name => 'User'
	#belongs_to :worker, :class_name => 'User'
	
	has_one :fix
    has_one :user, through: :fix
end
