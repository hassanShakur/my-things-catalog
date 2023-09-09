module OptionsDisplay
  def show_initial_options
    puts "\n
    1. List item references (Eg. List all authors)
    2. List catalog items (Eg. List all books)
    3. Create item reference (Eg. Author)
    4. Create catalog item (Eg. Book)
    5. Exit\n
    "
    print 'Enter your choice: '
  end

  def show_list_item_options
    puts "\n
      1. List all books
      2. List all games
      3. List all movies
      4. List all music albums
      5. Exit\n
      "
    print 'Enter your choice: '
  end

  def show_create_item_options
    puts "\n
      1. Create a book
      2. Create a game
      3. Create a movie
      4. Create a music album
      5. Exit\n
      "
    print 'Enter your choice: '
  end

  def show_list_ref_options
    puts "\n
      1. List all authors
      2. List all genres
      3. List all labels
      4. List all sources
      5. Exit\n
      "
    print 'Enter your choice: '
  end

  def show_create_ref_options
    puts "\n
      1. Create an author
      2. Create a genre
      3. Create a label
      4. Create a source
      5. Exit\n
      "
    print 'Enter your choice: '
  end
end
