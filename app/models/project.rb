class Project < ApplicationRecord
	has_many :bugs, dependent: :destroy
	has_many :assignments, dependent: :destroy
	has_many :users, through: :assignments

	belongs_to :manager, :class_name => 'User'

	validates :title, presence: true
	validates :description, presence: true

end
