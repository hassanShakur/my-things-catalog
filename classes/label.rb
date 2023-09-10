class Label
  attr_accessor :title, :color, :id

  def initialize(title, color, id: Time.new.to_i)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
