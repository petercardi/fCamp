require 'rails_helper'

feature 'Reviews CRUD' do

  before do
    user = User.create(first_name: "joe", last_name: "schmo", password: "password", email: "email@all.com")
    visit root_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Login"
  end

  scenario 'User can create reviews' do
    visit restaurants_path
    click_on 'Add Restaurant'
    fill_in 'Name', with: 'nettles'
    fill_in 'Hours', with: 'laaaate'
    click_on 'Create Restaurant'
    click_on 'nettles'
    click_on 'Write Review'
    fill_in 'Header', with: 'really good'
    fill_in 'Rating', with: '4'
    click_on 'Create Review'
    expect(page).to have_content('Review was successfully created')

    click_on 'nettles'
    click_on 'Write Review'
    fill_in 'Header', with: 'excellent'
    fill_in 'Rating', with: '5'
    click_on 'Create Review'
    click_on 'nettles'
    expect(page).to have_content('Average rating: 4.5')
  end

  scenario 'user can view reviews' do
    visit restaurants_path
    click_on 'Add Restaurant'
    fill_in 'Name', with: 'nettles'
    fill_in 'Hours', with: 'laaaate'
    click_on 'Create Restaurant'
    click_on 'nettles'
    click_on 'Write Review'
    fill_in 'Header', with: 'really good'
    fill_in 'Rating', with: '4'
    click_on 'Create Review'
    expect(current_path).to eq reviews_path
  end

end
