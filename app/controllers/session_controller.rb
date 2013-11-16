class SessionController < ApplicationController
  before_action :is_authenticated?, only: [ :destroy ]
  
  def new
    redirect_to root_url if current_user
  end
  
  def create
    email = params[:user][:email]
    password = params[:user][:password]
    
    if password.blank?
      if user = User.where(email: email).take
        if message = PasswordReset.new.send_password_reset( user )
          flash.now[:notice] = message
        else
          flash.now[:notice] = "Unable to reset your password. Check your passwords and try again."
        end
      else
        if message = UserRegistration.new.send_email_verification( email )
          flash.now[:notice] = message
        else
          flash.now[:error] = "Unable to begin registration. Check your email address and try again."
        end
      end
      
      render :new
    else
      if user = User.authenticate(email, password)
        session[:user_id] = user.id
        
        redirect_to root_url
      else
        flash.now[:error] = "Unable to sign you in. Please try again."
        
        render :new
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You've logged out."
  end
end
