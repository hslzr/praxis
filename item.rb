class Item
  attr_reader :index, :name
  attr_accessor :height
  attr_accessor :atk, :def

  def initialize(index, name, opts = {})
    @index, @name = index, name
    @atk = opts[:atk]
    @def = opts[:def]
  end
end
