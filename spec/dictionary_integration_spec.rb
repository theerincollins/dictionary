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

describe('add new definition path', {:type => :feature}) do
  it('show page a word that exists, a user can input a definition and it will be added to that word') do
    visit('/word/new')
    fill_in('definition', :with => 'wow')
    click_button('+ Add')
    expect(page).to have_content('wow')
  end
end
