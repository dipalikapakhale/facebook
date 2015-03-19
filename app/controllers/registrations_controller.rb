class RegistrationsController <  Devise::RegistrationsController

	def sign_up_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :avatar, :date_of_birth)
  end
 
  def account_update_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :avatar, :date_of_birth)
  end
end
