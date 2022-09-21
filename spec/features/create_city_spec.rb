require 'rails_helper'

RSpec.describe 'Creating a city', type: :feature do
  describe 'valid inputs' do
    it 'contains the city name' do
      visit new_city_path
      fill_in 'Name', with: 'Test'
      click_on 'Create City'
      visit cities_path
      expect(page).to have_content('Test')
    end
  end

  describe 'invalid inputs' do
    it 'raises an error' do
      visit new_city_path
      fill_in 'Name', with: ''
      click_on 'Create City'
      expect(page).to have_content("Name can't be blank")
    end
  end

  describe 'updating inputs' do
    it 'updates the city' do
      test = create(:city)
      visit edit_city_path(test)
      fill_in 'Name', with: 'Abc'
      click_on 'Update City'
      visit cities_path
      expect(page).to have_content('Abc')
    end
  end

  describe 'deleting a city' do
    it 'deletes the city' do
      test = create(:city, name: 'Test')
      visit cities_path
      expect(page).to have_content('Test')
      
      visit city_path(id: test.id)
      click_on 'Destroy this city'
      expect(page).not_to have_content('Test')
    end
  end

  describe 'testing FactoryBot' do
    it 'creates the city' do
      some_city = create(:city, name: 'foo')
      visit cities_path
      expect(page).to have_content('foo')
    end
  end
end
