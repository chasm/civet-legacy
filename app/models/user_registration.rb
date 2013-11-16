class UserRegistration
  REGISTRATION_MESSAGE = %{
    An email with instructions for completing your registration
    has been sent to you. }.squish
  
  def initialize
  end
  
  def send_email_verification(email)
    registrant = Registrant.new(email: email)
    
    if registrant.save
      Notifier.registration_request(registrant).deliver
      return REGISTRATION_MESSAGE
    end
    
    nil
  end
  
  def register_new_user(registrant, params)
    user = User.new(registration_params(params, registrant.email))
    
    if user.save
      registrant.destroy
      Notifier.registration(user).deliver
    end
    
    user
  end
  
  private
  
  def registration_params(params, email)
    params.require(:user)
      .merge({ email: email })
      .permit( :name, :email, :password, :password_confirmation )
  end
end