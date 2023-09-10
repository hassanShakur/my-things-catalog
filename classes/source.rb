class Source
  attr_accessor :name, :id

  def initialize(name, id: Time.new.to_i)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
