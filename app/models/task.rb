class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :activity, presence: true
end
