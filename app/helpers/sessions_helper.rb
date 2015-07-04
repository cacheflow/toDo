module SessionsHelper

  def login(user)
    session[:remember_token] = user.id 
  end

  def current_user 
    @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  end 

  def logout
    session.delete(:user_id)
    @current_user = nil 
  end 

  def current_user?(user)
    user == current_user 
  end 

end 