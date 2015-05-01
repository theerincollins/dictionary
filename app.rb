require('./lib/word')
require('./lib/definition')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @words = Word.all
  erb(:index)
end

get('/word/new') do
  erb(:new_word)
end

post('/save_word') do
  @new_word = Word.new(params.fetch("word_name"))
  definition = Definition.new(params.fetch("definition"))
  @new_word.add_definition(definition)
  @definitions = @new_word.get_definitions()
  @new_word.save()
  erb(:word)
end

get('/word/:id') do
  @new_word = Word.find(params.fetch('id').to_i())
  @definitions = @new_word.get_definitions()
  erb(:word)
end

post('/add_definition') do
  new_definition = Definition.new(params.fetch("definition"))
  @new_word = Word.find(params.fetch("word_id").to_i())
  @new_word.add_definition(new_definition)
  @definitions = @new_word.get_definitions()
  erb(:word)
end
