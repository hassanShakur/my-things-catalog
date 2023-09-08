require_relative 'item'

class MusicAlbum < Item
  def initialize(_author, on_spotify, publish_date, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    true
  end
end
