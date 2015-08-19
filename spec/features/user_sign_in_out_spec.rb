require 'rails_helper'

feature "User sign in and sign out" do

  before do
    @user = build(:user)
    @user.skip_confirmation!
    @user.save
    @invalid_user = build(:user, password: 'incorrect password')
  end

  scenario "user successfully signs in with email and password" do
    visit_sign_in_page
    fill_in_form_and_submit(@user)
    expect(page).to have_content('Signed in successfully')
  end

  scenario "user unsuccessfully signs in with invalid password" do
    visit_sign_in_page
    fill_in_form_and_submit(@invalid_user)
    expect(page).to have_content('Invalid email or password')
  end

  scenario "user can see whether or not she is signed in at the top of page" do
    visit_sign_in_page
    fill_in_form_and_submit(@user)
    expect(page).to have_content("Hi #{@user.name}!")
  end

  scenario "user can sign out" do
    visit_sign_in_page
    fill_in_form_and_submit(@user)
    click_link('Sign Out')
    expect(page).to have_content('Signed out successfully')
  end

  private

  def visit_sign_in_page
    visit root_path
    within '.welcome-box' do
      click_link 'Sign In'
    end
  end

  def fill_in_form_and_submit(user)
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => user.password)
    click_button 'Sign In'
  end

end
