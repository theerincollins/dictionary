class Definition
  @@definitions = []

  attr_reader(:description)

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
