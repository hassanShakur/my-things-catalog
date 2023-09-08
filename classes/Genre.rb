class Genre
    attr_accessor :name

    def initialize(name)
        @name = name
        @id = Time.new.to_f
        @items = []
    end

    def add_item(item)
        @items.push(item)
    end
end

