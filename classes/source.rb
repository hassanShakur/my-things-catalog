class Source
  attr_accessor :name

  def initialize(name)
    @id = Time.new.to_i
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
