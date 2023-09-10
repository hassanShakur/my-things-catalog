module ItemCreators
  def create_book
    notify_start_creation('book')
    publish_date = fetch_date
    publisher = fetch_string('publisher')
    cover_state = fetch_string('cover state [good/bad]')
    @books << Book.new(publisher, cover_state, publish_date)
    notify_success_creation('book')
  end

  def create_game
    notify_start_creation('game')
    publish_date = fetch_date
    multiplayer = fetch_valid_bool('multiplayer')
    last_played_at = fetch_date('last played at')
    @games << Game.new(multiplayer, last_played_at, publish_date)
    notify_success_creation('game')
  end

  def create_music_album
    notify_start_creation('music album')
    publish_date = fetch_date
    on_spotify = fetch_valid_bool('on spotify')
    @music_albums << MusicAlbum.new(on_spotify, publish_date)
    notify_success_creation('music album')
  end

  def create_movie
    notify_start_creation('movie')
    publish_date = fetch_date
    silent = fetch_valid_bool('is silent')
    @movies << Movie.new(silent, publish_date)
    notify_success_creation('movie')
  end
end
