def login(user)
  session[:remember_token] = user.id
  @current_user = @user
end

def logout
  session.delete(:user_id)
  @current_user = nil
end
