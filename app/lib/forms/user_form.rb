module Forms   
  class UserForm
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :email, :password, :password_confirmation, :user

    validates :first_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: Devise.password_length.min }
    validates :password_confirmation, presence: true
    
    def save
      if valid?
        @user = User.new(first_name: first_name,last_name: last_name, email: email, password: password, password_confirmation: password_confirmation)
        @user.save
        @user
      else
        false
      end
    end
    
  end
end
