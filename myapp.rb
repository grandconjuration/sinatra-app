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

  get '/smile' do
    ":)"
  end

  get '/branching' do
    "I'm dancing in the rain! I'm daaaaancing in the rain!"
  end

  get '/eyeinthesky' do
    "Don't think sorry's easily said
     Don't try, turnin' tables instead
     You've taken lots of chances before
     But I ain't gonna give anymore

     Don't ask me
     That's how it goes
     'Cause part of me knows what you're thinkin'

     Don't say words you're gonna regret
     Don't let the fire rush to your head
     I've heard the accusation before
     And I ain't gonna take any more

     Believe me
     The sun in your eyes
     Made some of the lies worth believing

     I am the eye in the sky, looking at you
     I can read your mind
     I am the maker of rules, dealing with fools
     I can cheat you blind

     And I don't need to see any more
     To know that

     I can read your mind
     (Looking at you)
     I can read your mind
     (Looking at you)

     I can read your mind
     (Looking at you)
     I can read your mind

     Don't leave false illusion behind
     Don't cry, I ain't changing my mind
     So find another fool like before
     'Cause I ain't gonna live anymore

     Believing
     Some of the lies
     While all of the signs are deceiving

     I am the eye in the sky, looking at you
     I can read your mind
     I am the maker of rules, dealing with fools
     I can cheat you blind

     And I don't need to see any more
     To know that

     I can read your mind
     (Looking at you)
     I can read you"
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
