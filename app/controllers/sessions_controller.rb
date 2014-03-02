class SessionsController < ApplicationController
  layout 'sessions'

  def new
    session[:return_to] = params[:return_to] if params[:return_to]
  end

  def create
    user = User.find_by_email params[:email].downcase

    if user && user.authenticate(params[:password])
      sign_in user

      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        redirect_to root_url
      end
    else
      flash.now[:error] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
