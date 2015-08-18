require 'rails_helper'

feature "Visitor signs up for an account" do

  scenario "Visitor successfully signs up using a username, email, and password" do
    visit root_path
    within '.welcome-box' do
      click_button('Sign Up')
    end

    fill_in('Name', :with => 'Jan Kroezen')
    fill_in('Email', :with => 'jankroezen@me.com')
    fill_in('Password', :with => 'helloworld')
    fill_in('Confirm Password', :with => 'helloworld')
    click_button('Sign Up')

    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario "Visitor signs up with an already registered email address" do
    visit root_path
    within '.welcome-box' do
      click_button('Sign Up')
    end

    fill_in('Name', :with => 'Jan Kroezen')
    fill_in('Email', :with => 'jankroezen@me.com')
    fill_in('Password', :with => 'helloworld')
    fill_in('Confirm Password', :with => 'helloworld')
    click_button('Sign Up')

    expect(page).to have_content('email address already exists')
  end

  scenario "Visitor signs up with an invalid email address" do
    visit root_path
    within '.welcome-box' do
      click_button('Sign Up')
    end

    fill_in('Name', :with => 'Jan Kroezen')
    fill_in('Email', :with => 'jankroezen')
    fill_in('Password', :with => 'helloworld')
    fill_in('Confirm Password', :with => 'helloworld')
    click_button('Sign Up')

    expect(page).to have_content('email address must be valid')
  end

end
