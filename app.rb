require('./lib/word')
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
  new_word = Word.new(params.fetch("word_name"))
  new_word.save()
  @words = Word.all
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end
