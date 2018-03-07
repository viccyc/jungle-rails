require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(
          first_name: 'Viccy',
          last_name: 'Carver',
          email: 'viccy@viccy.com',
          password: 'xxxxxx',
          password_confirmation: 'xxxxxx')
  end

  scenario "The user can login correctly" do
    # ACT
    visit login_path
    # DEBUG / VERIFY
    within 'form' do
      fill_in id: 'email', with: 'viccy@viccy.com'
      fill_in id: 'password', with: 'xxxxxx'

      click_button 'Submit'
    end

    expect(page).to have_current_path (root_path)
    expect(page).to have_content('Signed in as viccy@viccy.com')
  end
end
