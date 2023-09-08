require_relative 'item'

class Movie < Item
  attr_accessor :silet

  def initialize(_author, silet, publish_date, archived)
    super(publish_date, archived)
    @silet = silet
  end

  private

  def can_be_archived?
    true
  end
end
