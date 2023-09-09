require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, publish_date, id: Time.new.to_i)
    super(publish_date, id: id)
    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent
  end
end
