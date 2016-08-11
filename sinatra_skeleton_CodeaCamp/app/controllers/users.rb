#CREATE
get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to("/users/#{user.id}")
  end
end

#READ
get '/login' do 
  erb :login
end

post '/login' do
  user = params[:user]
  user = User.authenticate(user["email"], user["password"])
  if user != nil 
    session[:user_id] = user.id
    redirect to("/users/#{user.id}")
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

#UPDATE
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])
  redirect to("/users/#{user.id}")
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
  erb :edit
end


