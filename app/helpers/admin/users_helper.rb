module Admin::UsersHelper
  def role_options
    return User.roles.keys.map {|role| [t(role, scope: :user), role]}.to_h
  end      
end
