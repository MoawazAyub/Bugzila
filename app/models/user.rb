class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments

  #has_one :bug_worker, :class_name => 'Bug', :foreign_key => 'worker_id'
  has_one :bug_founder, :class_name => 'Bug', :foreign_key => 'founder_id'

  has_many :fixes
  has_many :bugs, through: :fixes


end
