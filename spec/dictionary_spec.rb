require('rspec')
require('word')

describe Word do

  before do
    Word.clear()
  end

  describe('.all') do
    it('will return array of all words') do
      test_word = Word.new("cheeseburger").save()
      expect(Word.all).to(eq(test_word))
    end
    it('will be empty at first') do
      @@words = []
    end
  end

  describe('.clear') do
    it('will clear out array of words') do
      test_word = Word.new("cheeseburger").save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a word to an array of all words') do
      test_word = Word.new("vegan")
      test_word.save()
      expect(Word.all).to(eq([test_word]))
    end
  end

  describe('#id') do
    it('will return id of a word') do
      test_word = Word.new("Snoopy")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#name') do
    it('will return the name of a word') do
      test_word = Word.new("Peanut")
      expect(test_word.word_name()).to(eq("Peanut"))
    end
  end

  describe('.find') do
    it("will return a word by using that word's id") do
      test_word1 = Word.new("Hard")
      test_word1.save()
      test_word2 = Word.new("Rock")
      test_word2.save()
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end
end
