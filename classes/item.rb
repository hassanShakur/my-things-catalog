class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(author, genre, source, label)
    @id = Time.new.to_f
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = nil
    @archived = false
  end

  def move_to_archive
    @archived = true
  end

  private

  def can_be_archived?; end
end
