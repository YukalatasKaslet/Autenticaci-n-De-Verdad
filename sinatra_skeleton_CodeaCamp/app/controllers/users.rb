#CREATE
get '/signup' do
  erb :'user/signup'
end

post '/signup' do
  user = User.new(name: params[:user]["name"], email: params[:user]["email"])
  user.password=(params[:user]["password"])
  if user.save
    session[:user_id] = user.id
    redirect to("/users/#{user.id}")
  else
    redirect to ('/Error')
  end
end

#READ
get '/login' do 
  erb :'user/login'
end

post '/login' do
  user = params[:user]
  user = User.authenticate(user["email"], user["password"])
  if user != nil 
    session[:user_id] = user.id
    redirect to("/users/#{user.id}")
  else
    redirect to ('/Error')
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'user/profile'
end

#UPDATE
put '/users/:id' do
  user = User.find(params[:id])

  user = User.authenticate(user.email, params[:user]["password"])
  if user != nil
    user.password=(params[:user]["new_password"])
    user.save
    redirect to("/users/#{user.id}")
  else
    redirect to ('/Error')
  end
  
end

#DELETE
delete '/users/:id' do
  user = User.find(params[:id])
  user.destroy

  redirect to ('/logout')
end

get '/logout' do
  session.clear
  redirect to('/')
end

#EDIT 
get '/users/:id/edit' do
  @user = User.find(params[:id]) 
  erb :'user/edit'
end


get '/Error' do
  erb :error
end