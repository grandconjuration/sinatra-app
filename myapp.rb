require 'sinatra'
require 'curb'
require 'json'

enable :sessions

  post '/login' do
    username = params['username']
    password = params['password']
    c = Curl::Easy.perform("https://api.e-golf4u.nl/auth/validate?username=" + username + "&password=" + password + "&environment=rosendaelsche")
    loginData = JSON.parse c.body_str

    if loginData['valid'] == true
      session['loggedIn'] = true
      redirect to('/index.html')
    else
      erb :index
    end
  end

  get '/branching' do
    "I'm dancing in the rain! I'm daaaaancing in the rain!"
  end

  get '/login' do
    erb :index
  end

  get /.+/ do
    if session[:loggedIn] == true
      send_sinatra_file(request.path) {404}
    else
      redirect to('/login')
    end
  end

  not_found do
    send_sinatra_file('404.html') {"Sorry, I cannot find #{request.path}"}
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), '_site',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end
#end
