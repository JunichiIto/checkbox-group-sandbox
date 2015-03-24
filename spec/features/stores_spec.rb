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

    click_on 'Edit'
    expect(page).to have_checked_field('駐車場あり')
    expect(page).to have_checked_field('クレジットカード可')
    expect(page).to have_unchecked_field('個室あり')
    uncheck '駐車場あり'
    uncheck 'クレジットカード可'
    click_on 'Update Store'
    expect(page).to have_content 'Store was successfully updated.'
    expect(page).to_not have_content '駐車場あり'
    expect(page).to_not have_content '個室あり'
    expect(page).to_not have_content 'クレジットカード可'
    expect(Store.last.facilities.size).to eq 0
  end
end