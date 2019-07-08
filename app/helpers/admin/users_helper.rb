module Admin::UsersHelper
  def role_options
    return [[t('user.role0'), 0], [t('user.role9'), 9]]
  end      
end
