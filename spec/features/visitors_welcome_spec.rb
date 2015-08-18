require 'rails_helper'

describe "initial welcome pages" do

  it "starts the visitor off on the welcome page" do
    visit root_path
    expect(page).to have_content("Your missions should you choose to accept them...")
  end

  it "links to the about page" do
    visit root_path
    click_link('About')
    expect(page).to have_content('Are you tired of never-ending To Do lists?')
  end

end
