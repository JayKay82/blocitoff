require 'rails_helper'

feature 'User creates a ToDo item' do

  before do
    @user = build(:user)
    @user.skip_confirmation!
    @user.save
    user_signs_in
  end

  scenario 'successfully', js: true do
    fill_in('item[name]', with: 'Clean the flat')
    click_button('add')
    expect(page.text).to have_content('Clean the flat')
  end

  private

  def user_signs_in
    visit root_path
    within '.welcome-box' do
      click_link 'Sign In'
    end
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button 'Sign In'
  end

end
