require 'rails_helper'

feature 'User deletes a ToDo item' do

  before do
    create_a_user_and_sign_in
    user_creates_a_to_do_item
  end

  scenario 'successfully', js: true do
    click_link ''

    expect(page).not_to have_content('Clean the Flat')
  end

  private

  def create_a_user_and_sign_in
    # Create a user
    @user = build(:user)
    @user.skip_confirmation!
    @user.save

    # Sign in
    visit root_path
    within '.welcome-box' do
      click_link 'Sign In'
    end
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button 'Sign In'
  end

  def user_creates_a_to_do_item
    # Create a Todo item
    fill_in('item[name]', with: 'Clean the Flat')
    click_button 'add'
  end

end
