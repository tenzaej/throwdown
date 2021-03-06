class SessionController < ApplicationController
  skip_before_action :redirect_visitors, only: [ :login, :new]

  def new
    @user = User.new
    if request.xhr?
      render 'session/_new', layout: false
    else
      render 'new'
    end
  end

  def login
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      puts session[:user_id]
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Incorrect username/password input'
      redirect_to '/'
    end
  end

  def logout
    log_out
    redirect_to '/'
  end

end
