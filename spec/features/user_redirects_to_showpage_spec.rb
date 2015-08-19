require 'rails_helper'

feature "User gets redirected to show page" do

  before do
    @user = build(:user)
    @user.skip_confirmation!
    @user.save
  end

  scenario "successfully redirects to user's show page" do
    user_signs_in
    expect(current_path).to eq(user_path(@user))
  end

  scenario "successfully displays user's information" do
    user_signs_in
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.email)
  end

  scenario "successfully displays an edit button to edit user's information" do
    user_signs_in
    expect(page).to have_link('Edit User')
  end

  def user_signs_in
    visit root_path
    within '.welcome-box' do
      click_link 'Sign In'
    end
    fill_in('Email', :with => @user.email)
    fill_in('Password', :with => @user.password)
    click_button('Sign In')
  end

end
