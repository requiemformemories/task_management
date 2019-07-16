require "rails_helper"

RSpec.feature "managing users", :type => :feature do
  context "create user" do  
    let!(:adminuser) { User.create(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => "admin") }
    
    before :each do
      visit '/login'
      login adminuser.username, adminuser.password
      visit '/admin/users'
    end
    
  
    scenario "create default user" do
      click_link I18n.t("user.new_user")
      within("form#new_user") do
        fill_in "user[name]", :with => "name1"
        fill_in "user[username]", :with => "name1"
        fill_in "user[password]", :with => "pa**word"
        fill_in "user[password_confirmation]", :with => "pa**word"
        select(I18n.t("user.default_user"), from: 'user[role]')
      end
      click_button I18n.t("create")
      find(:xpath, "(//a[text()='展開'])[2]").click
      expect(page).to have_content 'name1'
      expect(page).to have_content I18n.t("user.default_user")
    end
    
    scenario "create admin user" do
      click_link I18n.t("user.new_user")
      within("form#new_user") do
        fill_in "user[name]", :with => "name1"
        fill_in "user[username]", :with => "name1"
        fill_in "user[password]", :with => "pa**word"
        fill_in "user[password_confirmation]", :with => "pa**word"
        select(I18n.t("user.admin"), from: 'user[role]')
      end
      click_button I18n.t("create")
      find(:xpath, "(//a[text()='展開'])[2]").click
      expect(page).to have_content 'name1'
      expect(page).to have_content I18n.t("user.admin")
    end
  end
  
  context "edit user" do  
    let!(:adminuser) { User.create(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => "admin") }
    let!(:user1) { User.create(:name => "name1", :username => "username1", :password => "secr**", :password_confirmation => "secr**",:role => "default_user") }
    
    before :each do
      visit '/login'
      login adminuser.username, adminuser.password
      visit '/admin/users'
    end
    
    scenario "edit user" do
      find(:xpath, "(//a[text()='修改'])[2]").click
      within("form.edit_user") do
        fill_in "user[name]", :with => "name2"
        fill_in "user[username]", :with => "name2"
        select(I18n.t("user.admin"), from: 'user[role]')
      end
      click_button I18n.t("update")
      find(:xpath, "(//a[text()='展開'])[2]").click
      expect(page).to have_content 'name2'
      expect(page).to have_content I18n.t("user.admin")
    end
    
    scenario "delete user" do
      find(:xpath, "(//a[text()='刪除'])[2]").click
      expect(page).to have_no_content 'name1'
      expect(page).to have_content I18n.t("user.delete_success")
    end
    
    scenario "change user password" do
      find(:xpath, "(//a[text()='修改密碼'])[2]").click
      within("form.edit_user") do
        fill_in "user[password]", :with => "new_password"
        fill_in "user[password_confirmation]", :with => "new_password"
      end
      click_button I18n.t("update")
      click_link I18n.t("user.logout")
      visit '/login'
      login user1.username, "new_password"
      expect(page).to have_content I18n.t("user.login_success")
    end
  end  
end

private

def login(username, password)
  fill_in I18n.t('user.username'), with: username
  fill_in I18n.t('user.password'), with: password
  click_button I18n.t('user.login')
end