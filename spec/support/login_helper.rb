def login(user)
  session[:remember_token] = user.id
  @current_user = @user
end
