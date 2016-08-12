=begin
#Helper en un inicio
def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end
=end

helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
#El primer método te servirá para hacer referencia dentro de tus controladores y vistas a el usuario que tiene una sesión. El segundo método te servirá para poder poner lógica que dependa si el usuario tiene una sesión o no.