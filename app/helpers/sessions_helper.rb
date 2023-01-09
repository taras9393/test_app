module SessionsHelper

# Осуществляет вход данного пользователя

  def logg_in(huuser)
   session[:user_id] = huuser.id
  end

# Возвращает текущего вошедшего пользователя (если есть)
 def current_user
   User.find_by(id: session[:user_id])
 end

 def logged_in?
  if current_user.nil?
    false
  else
    true
  end
 end

 def log_out
  session.delete(:user_id)
 end

end
