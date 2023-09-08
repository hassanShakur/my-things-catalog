require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(author, publisher, cover_state)
    super(author)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    true
  end
end
