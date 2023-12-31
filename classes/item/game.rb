require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, id: Time.new.to_i)
    super(publish_date, id: id)
    @multiplayer = multiplayer
    @last_played_at = Time.new(last_played_at.to_s)
  end

  private

  def can_be_archived?
    super && ((@last_played_at.year - Time.new.year) > 2)
  end
end
