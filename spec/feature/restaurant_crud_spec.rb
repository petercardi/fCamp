require 'rails_helper'

feature 'Restaurants CRUD' do

  before do
    user = User.create(first_name: "joe", last_name: "schmo", password: "password", email: "email@all.com")
    visit root_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on "Login"
  end

  scenario 'User can create restaurants' do
    visit restaurants_path
    click_on 'Add Restaurant'
    fill_in 'Name', with: 'nettles'
    fill_in 'Hours', with: 'laaaate'
    click_on 'Create Restaurant'
    expect(page).to have_content('Restaurant profile was successfully created.')
  end

  scenario 'user can read restaurants' do
    visit restaurants_path
    click_on 'Add Restaurant'
    fill_in 'Name', with: 'nettles'
    fill_in 'Hours', with: 'laaaate'
    click_on 'Create Restaurant'
    click_on 'nettles'
    expect(current_path).to_not have_content('Review this Restaurant')
  end

  scenario 'user can update restaurants' do
    visit restaurants_path
    click_on 'Add Restaurant'
    fill_in 'Name', with: 'nettles'
    fill_in 'Hours', with: 'laaaate'
    click_on 'Create Restaurant'
    click_on 'nettles'
    click_on 'Edit'
    fill_in 'Phone number', with: "3333333"
    click_on 'Update Restaurant'
    expect(page).to have_content('Restaurant profile was successfully updated.')
  end

  scenario 'user can delete restaurants' do
    visit restaurants_path
    click_on 'Add Restaurant'
    fill_in 'Name', with: 'nettles'
    fill_in 'Hours', with: 'laaaate'
    click_on 'Create Restaurant'
    click_on 'nettles'
    click_on 'Delete'
    expect(page).to have_content('Restaurant was successfully burned to the ground.')
  end

end
