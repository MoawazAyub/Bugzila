class Bug < ApplicationRecord
	belongs_to :project
	belongs_to :founder, :class_name => 'User'
	#belongs_to :worker, :class_name => 'User'
	
	has_one :fix
    has_one :user, through: :fix

    mount_uploader :screenshot, ImageUploader

    validates :title, presence: true
    validates :title, uniqueness: { scope: :project_id,
    message: "Already bug" }


end
