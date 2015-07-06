class Task < ActiveRecord::Base
  include SessionsHelper
  belongs_to :user
  # before_create :sanitize_size 
  validates_presence_of :item
  before_create :set_completed_status
  acts_as_paranoid
  def set_completed_status 
    !self.completed = false 
  end 
end
