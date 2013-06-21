get '/logout' do
  session.clear
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do 
  user = User.create_user(params[:user])
  session[:id] = user.id
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(params[:user])
  if user
    session[:id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end
