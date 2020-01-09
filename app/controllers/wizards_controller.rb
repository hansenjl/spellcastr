class WizardsController < ApplicationController

  # GET: /wizards
  get "/wizards" do
    erb :"/wizards/index.html"
  end

  get "/signup" do
    erb :"/wizards/new.html"
  end

  # POST: /signup
  post "/signup" do
    #check that the fields are filled in
    # if params[:wizard][:username].empty? || params[:wizard][:email].empty? || params[:wizard][:password].empty?
    if params[:wizard].values.any? {|v|v.blank?}
      redirect '/signup'

      #check that the username isn't taken
    elsif Wizard.find_by(username: params[:wizard][:username])
      redirect '/signup'
    else
      # Create a new wizard
      wizard = Wizard.create(params[:wizard])

      # log them in
      session[:wizard_id] = wizard.id
      binding.pry
      # redirect them to a show page
       redirect "/wizards/#{wizard.id}"
    end
 end

  # GET: /wizards/5
  get "/wizards/:id" do
    erb :"/wizards/show.html"
  end

  get "/logout" do
    session.clear
    redirect "/signup"
  end

  get "/login" do
    erb :"/wizards/login.html"
  end

  post "/login" do

    # did they give a valid username & password?
    wizard = Wizard.find_by(username: params[:wizard][:username])
    if wizard && wizard.authenticate(params[:wizard][:password])
      #they successfully logged in!
      session[:wizard_id] = wizard.id
      redirect "/wizards/#{wizard.id}"
    else
      redirect "/login"
    end
  end

end
