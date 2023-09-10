class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :id

  def initialize(publish_date, id: Time.new.to_i)
    @id = id
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = transform_date(publish_date.to_s)
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def transform_date(date)
    if date.include? '/'
      pd_arr = date.to_s.split('/')
      Time.new(pd_arr[0], pd_arr[1], pd_arr[2])
    else
      Time.new(date)
    end
  end

  private

  def can_be_archived?
    (Time.new.year - @publish_date.year) > 10
  end
end
