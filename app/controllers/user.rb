enable :sessions

helpers do
  def authenticate
    if session[:user_id]
      true
    else
      redirect '/'
    end
  end
end


get '/mainpage' do
@posts = Post.all

  erb :mainpage

end


post  '/signup' do
  p "=====signup======"
  @user = User.new(params)
  if @user.save
    p "=============succcesfully register=============="
    redirect "/"
  else
    p "================failed to register============="
    redirect "/"
  end
end

post "/mainpage" do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    p "================login succcesfully============"
    redirect '/mainpage'
  else
    p "login failed"
    redirect '/'
  end
end


get ' /uploads' do
  @post = Post.find params[:user_id]

end


post '/uploads' do
  @post = Post.new
  @post.file = params[:image]
  @post.save
  redirect "/mainpage"
end

get '/:pid/comments' do
  @post = Post.find(params[:pid])
  @uid = session[:uid]
  redirect "/mainpage"
end

post '/:pid/comments' do
  @post = Post.find(params[:pid])
  @uid = User.where(name:session[:uid]).first
  comments = Comment.new(params)
  @post.comments.create(comments:params[:comments],user_id:@uid.id)
end



get '/user/:name' do
  # @user = User.where(name: params[:name]).first
  @posts = Post.all
  @uid = session[:uid]

  erb :user_profile
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

