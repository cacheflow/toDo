class Task < ActiveRecord::Base
  before_create :add_current_user_to_tasks 
  belongs_to :user 
  # before_create :sanitize_size 
  validates :item, presence: true, length: {minimum: 3}

  def add_current_user_to_tasks  
    self.user_id ||= current_user.id
  end  
end
