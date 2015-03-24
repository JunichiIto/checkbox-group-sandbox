require 'rails_helper'

feature 'Stores', type: :feature do
  scenario 'Manage stores' do
    visit root_path
    click_on 'New Store'
    fill_in 'Name', with: 'Awesome cafe'
    check '駐車場あり'
    check 'クレジットカード可'
    click_on 'Create Store'
    expect(page).to have_content 'Store was successfully created.'
    expect(page).to have_content '駐車場あり, クレジットカード可'
  end
end