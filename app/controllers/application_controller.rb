require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super_secret_code_word"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_wizard
      #memoization
      @current_wizard ||= Wizard.find_by_id(session[:wizard_id])
    end

    def logged_in?
      !!current_wizard
    end
  end

end
