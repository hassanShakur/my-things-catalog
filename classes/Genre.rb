class Genre
  attr_accessor :name, :id, :items

  def initialize(name, id: Time.new.to_i)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
