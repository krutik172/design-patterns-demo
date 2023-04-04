class RegistrationsController < Devise::RegistrationsController
    def create
      @form = Forms::UserForm.new(user_form_params)
      
      if @form.save
        sign_in(@form.user)
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
  
    def user_form_params
      params.permit(:first_name, :last_name,:email, :password, :password_confirmation)
    end
 end