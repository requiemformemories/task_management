class User < ApplicationRecord
  has_secure_password
  enum role: [ :default_user, :admin ]

  before_validation :generate_id, on: :create
  before_destroy :delete_check
  
  validates_presence_of :uid, :name, :username, :role
  validates_uniqueness_of :uid, :username
  validates :name, length: {maximum: 20}
  validates :username, length: {maximum: 20}
  has_many :user_taskships, :dependent => :destroy
  has_many :tasks, :through => :user_taskships, :dependent => :destroy
  
  private
  def generate_id
    self.uid = SecureRandom.uuid
  end
  
  def delete_check
    if no_last_admin
      self.errors.messages[:role] = I18n.t('user.need_last_admin')
      throw(:abort)
    end
    
  end  

  def no_last_admin
    User.where(role: :admin).count == 1 and self.role == "admin"
  end
end
