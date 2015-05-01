require('rspec')
require('word')
require('definition')

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
      expect(Word.all).to(eq([]))
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

  describe('#add_definition') do
    it("will add a definition to a word's array of definitions") do
      test_definition1 = Definition.new("it barks a lot")
      test_definition2 = Definition.new("it pees a lot")
      test_word = Word.new("dog")
      test_word.save()
      test_word.add_definition(test_definition1)
      test_word.add_definition(test_definition2)
      expect(test_word.get_definitions()).to(eq([test_definition1, test_definition2]))
    end
  end

  describe('.duplicate?') do
    it('will return true if the word entered is alread in the dictionary') do
      test_word1 = Word.new("dog")
      test_word1.save()
      test_word2 = Word.new("dog")
      test_word2.save()
      expect(Word.duplicate?(test_word2.word_name())).to(eq(true))
    end
  end

  describe('.delete_duplicate') do
    it('will delete the last word if it was a duplicate') do
      test_word1 = Word.new("cat")
      test_word1.save()
      test_word2 = Word.new("dog")
      test_word2.save()
      test_word3 = Word.new("dog")
      test_word3.save()
      Word.delete_duplicate(test_word3)
      expect(Word.all).to(eq([test_word1, test_word2]))
    end
  end
end

describe Definition do

  before do
    Definition.clear()
  end

  describe('.clear') do
    it('will clear array of definitions') do
      Definition.new("this and that").save()
      Definition.clear
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a definition to an array of definitions') do
      test_definition = Definition.new("those things over there")
      test_definition.save()
      expect(Definition.all).to(eq([test_definition]))
    end
  end

  describe('#description') do
    it('will return the description of the definition') do
      test_definition = Definition.new("those things over there")
      expect(test_definition.description).to(eq("those things over there"))
    end
  end

end
