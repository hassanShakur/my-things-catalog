class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, id: Time.new.to_i)
    @id = id
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    pd_arr = publish_date.to_s.split('/')
    @publish_date = Time.new(pd_arr[0], pd_arr[1], pd_arr[2])
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Time.new.year - @publish_date.year) > 10
  end
end
