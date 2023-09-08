class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize()
    @id = Time.new.to_i
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = nil
    @archived = false
  end

  def move_to_archive
    @archived = true
  end

  private

  def can_be_archived?
    true
  end
end
