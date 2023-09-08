require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Time.new(last_played_at)
  end

  private

  def can_be_archived?
    super && ((@last_played_at.year - Time.new.year) > 2)
  end
end
