module AppLogic
  def show_options
    puts "\n
    1. List all books
    2. List all labels
    3. Add a book
    4. List all music albums
    5. List all genres
    6. Add a music album
    7. List all games
    8. List all authors
    9. Add a game

    "
  end

  def call_activity_for(_choice)
    display_books
  end
end
