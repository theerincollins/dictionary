require ('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new word path', {:type => :feature}) do
  it('show page for input a new word and then display that word with all other words in the dictionary') do
    visit('/word/new')
    fill_in('word_name', :with => 'Airplane')
    click_button('+ Add')
    expect(page).to have_content('Airplane')    
  end
end
