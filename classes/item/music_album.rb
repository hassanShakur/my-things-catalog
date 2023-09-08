require_relative 'item'

class MusicAlbum < Item
  def initialize(author, on_spotify)
    super(author)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    true
  end
end
