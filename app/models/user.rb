class User < ApplicationRecord
  validates_presence_of :uid, :name, :username, :passwd, :role
  validates_uniqueness_of :uid, :username
  has_many :user_taskships
  has_many :tasks, :through => :user_taskships
end
