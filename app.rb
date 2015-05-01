require('./lib/word')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  test_word1 = Word.new("computer")
  test_word1.save()
  test_word2 = Word.new('mouse')
  test_word2.save()
  @words = Word.all
  erb(:index)
end
