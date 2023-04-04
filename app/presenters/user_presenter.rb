class UserPresenter 
  def initialize(user)
    @user = user
  end

  def full_name
  "#{first_name} #{last_name}"
  end

  private

  attr_reader :user

  def first_name
    user.first_name.capitalize
  end

  def last_name
    user.last_name.capitalize
  end
end
