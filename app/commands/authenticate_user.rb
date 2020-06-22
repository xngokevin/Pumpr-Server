class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(
        user_id: api_user.id,
        first_name: api_user.first_name,
        last_name: api_user.last_name,
        middle_name: api_user.middle_name
    ) if api_user
  end


  attr_accessor :email, :password

  def api_user
    user = User.find_by_email(email)
    unless user.present?
      errors.add :message, "Invalid email / password"
      return nil
    end

    # Verify the password
    unless user.valid_password?(password)
      errors.add :message, "Invalid email / password"
      return nil
    end

    user
  end

end