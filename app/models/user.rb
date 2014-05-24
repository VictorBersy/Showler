class User < ActiveRecord::Base
  before_save do
    self.screen_name = self.username
    self.username = self.username.downcase
  end
  has_secure_password
end
