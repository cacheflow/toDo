class User < ActiveRecord::Base
  has_secure_password 
  has_many :tasks, class_name: 'Task'
  validates_presence_of :name, :email, :password
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, :name
  has_attached_file(:avatar, 
                :default_url => 'http://will.i.am/img/app/footer-image.png',
                :styles => {:medium => "300x300>", :thumb => "100x100>"})

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.search(query)
    all.joins(:user).where('users.name ILIKE ? OR items.name ILIKE ?',"%#{query}%", "%#{query}%")
  end 
end
