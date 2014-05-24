class User < ActiveRecord::Base
  before_create do
    :create_remember_token
    self.screen_name = self.username
    self.username = self.username.downcase
  end
  before_create
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
