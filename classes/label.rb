class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Time.new.to_i
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
