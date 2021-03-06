class Word

  @@words = []

  attr_reader(:word_name, :id)

  define_method(:initialize) do |word_name|
    @word_name = word_name
    @id = @@words.length() + 1
    @word_definitions = []
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:find) do |id|
    found_word = ''
    @@words.each do |word|
      if word.id() == id
        found_word = word
      end
    end
    found_word
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_method(:add_definition) do |definition|
    @word_definitions.push(definition)
  end

  define_method(:get_definitions) do
    @word_definitions
  end

  define_singleton_method(:duplicate?) do |word_name|
    duplicate = nil
    @@words.each do |word|
      if word.word_name == word_name
        duplicate = true
      end
    end
    duplicate
  end

  define_singleton_method(:delete_duplicate) do |word|
    if Word.duplicate?(word.word_name())
      @@words.pop
    end
    @@words
  end
end
