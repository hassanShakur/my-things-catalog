class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, archived)
    @id = Time.new.to_i
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true
  end

  private

  def can_be_archived?
    true
  end
end
