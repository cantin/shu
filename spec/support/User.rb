#encoding: utf-8
def user_create
  u = User.new(name: Faker::Name.name, email: "test@shu.com", password: '123456', password_confirmation: '123456')
  u.confirm!
  u
end

def user_login(user)
  visit '/users/sign_in'
  fill_in "user_email", :with=>user.email
  fill_in "user_password", :with=>user.password
  click_button "登录"
end
