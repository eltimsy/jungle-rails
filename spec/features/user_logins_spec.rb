require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do
  before :each do
    @user = User.create!(
      first_name: "abc",
      last_name: "cde",
      email: "5@5.com",
      password: "ablaksdjf"
    )
  end
  scenario "test that users can login and go to home page" do
    visit '/login'
    fill_in 'email', with: '5@5.com'
    fill_in 'password', with: 'ablaksdjf'
    click_button 'Login'

    expect(page).to have_content('abc')
  end
end
