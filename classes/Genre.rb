class Genre
  attr_accessor :name

  def initialize(name)
    @name = name
    @id = Time.new.to_i
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
