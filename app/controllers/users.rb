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



# class User < ActiveRecord::Base

#   validates :username, :presence => :true
#   validates :password, :presence => :true, :length => { :minimum => 3 }


#   def self.create_user(user)
#     User.create(username: user[:username],
#                 password: BCrypt::Password.create(user[:password]))
#   end

#   def self.authenticate(params)
#     if user = User.find_by_username(username)
#       return user if BCrypt::Password.new(user.password) == params[:password]
#     end
#   end
# end
