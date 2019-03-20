class Fix < ApplicationRecord
  belongs_to :user
  belongs_to :bug
end
