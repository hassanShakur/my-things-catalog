class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Time.new.to_i
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
