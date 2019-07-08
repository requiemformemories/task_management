require "rails_helper"

RSpec.feature "login and logout function", :type => :feature do
  context "login and logout function" do  
    let!(:user) { User.create(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => 9) }
    
    before :each do
      visit '/login'
      login user.username, user.password
    end
    
    scenario 'login sucessfully' do
      expect(page).to have_content I18n.t("user.login_success")
    end
    
    scenario 'logout sucessfully' do
      click_link I18n.t("user.logout")
      expect(page).to have_content I18n.t("user.not_login_notice")
      # should be "user.logged_out_notice" but there is no index page for not logined user.
    end
    
    scenario 'admin get in admin pages sucessfully' do
      visit 'admin/users'  
      expect(page).to have_content I18n.t('user.users').capitalize
    end
  end
  
  context "block unvaild users" do  
    let!(:user) { User.create(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => 0) }
    
    scenario 'login sucessfully' do
      visit '/login'
      login user.username, "secret"    
        
      expect(page).to have_content I18n.t("user.login_failed")
    end
    
    scenario 'unable to visit admin page' do
      visit '/login'
      login user.username, user.password   
      visit 'admin/users'  
      expect(page).to have_content I18n.t("user.auth_failed")
    end
    
    
    
  end
end 

private

def login(username, password)
  fill_in I18n.t('user.username'), with: username
  fill_in I18n.t('user.password'), with: password
  click_button I18n.t('user.login')
end