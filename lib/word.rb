class Word

  @@words = []

  attr_reader(:word_name, :id)

  define_method(:initialize) do |word_name|
    @word_name = word_name
    @id = @@words.length() + 1
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

end
