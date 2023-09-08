require_relative 'item'

class Movie < Item
  attr_accessor :silet

  def initialize(author, silet)
    super(author)
    @silet = silet
  end

  private

  def can_be_archived?
    true
  end
end
