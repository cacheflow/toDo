class Task < ActiveRecord::Base
  include SessionsHelper
  belongs_to :user
  validates_presence_of :item
  searchkick 
  before_create :set_completed_status
  acts_as_paranoid
  
  scope :not_completed, -> { where(completed: false) }
  scope :completed, -> { where(completed: true)}
  scope :not_deleted, -> {where(deleted_at: nil)}
  scope :search_import, -> {includes (:user)}

  def set_completed_status 
    !self.completed = false 
  end 

  
end
