require 'rails_helper'

feature "Visitor signs up for an account" do

  before do
    @valid_user = build(:user)
    @invalid_user = build(:user, email: 'jankroezen')
  end

  scenario "Visitor successfully signs up using a username, email, and password" do
    visit_signup_page
    fill_in_form_and_submit(@valid_user)
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario "Visitor signs up with an already registered email address" do
    2.times do
      visit_signup_page
      fill_in_form_and_submit(@valid_user)
    end
    expect(page).to have_content('Email has already been taken')
  end

  scenario "Visitor signs up with an invalid email address" do
    visit_signup_page
    fill_in_form_and_submit(@invalid_user)
    expect(page).to have_content('Email is invalid')
  end

  private

  def visit_signup_page
    visit root_path
    within '.welcome-box' do
      click_link('Sign Up')
    end
  end

  def fill_in_form_and_submit(test_user)
    fill_in('Name', :with => test_user.name)
    fill_in('Email', :with => test_user.email)
    fill_in('Password', :with => test_user.password)
    fill_in('Password confirmation', :with => test_user.password_confirmation)
    click_button('Sign up')
  end

end
