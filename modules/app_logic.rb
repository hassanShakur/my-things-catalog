module AppLogic
  def show_initial_options
    puts "\n
    1. List item references (Eg. List all authors)
    2. List catalog items (Eg. List all books)
    3. Create item reference (Eg. Author)
    4. Create catalog item (Eg. Book)
    5. Exit\n\n
    "
  end

  def show_extra_options(choice)
    case choice
    when 1, 3
      show_item_ref_options(choice)
    when 2, 4
      show_item_options(choice)
    else
      puts 'Invalid choice!'
    end
  end

  def show_item_ref_options(choice)
    case choice
    when 1
      show_list_ref_options

      input = gets.chomp.to_i
      choice = validate_input(input, 5)
      break if choice == 5

      list_refs(choice)
    when 3
      show_create_ref_options

      input = gets.chomp.to_i
      choice = validate_input(input, 5)
      break if choice == 5

      create_ref(choice)
    else
      puts 'Invalid choice!'
    end
  end

  def show_item_options(choice)
    case choice
    when 2
      puts "\n
      1. List all books
      2. List all games
      3. List all movies
      4. List all music albums
      5. Exit\n\n
      "
    when 4
      puts "\n
      1. Create a book
      2. Create a game
      3. Create a movie
      4. Create a music album
      5. Exit\n\n
      "
    else
      puts 'Invalid choice!'
    end
  end

  def show_list_ref_options
    puts "\n
      1. List all authors
      2. List all genres
      3. List all labels
      4. List all sources
      5. Exit\n\n
      "
  end

  def show_create_ref_options
    puts "\n
      1. Create an author
      2. Create a genre
      3. Create a label
      4. Create a source
      5. Exit\n\n
      "
  end

  def list_refs(choice)
    case choice
    when 1 then display_authors
    when 2 then display_genres
    when 3 then display_labels
    when 4 then display_sources
    else
      puts 'Invalid choice!'
    end
  end

  def create_ref(choice)
    case choice
    when 1 then create_author
    when 2 then create_genre
    when 3 then create_label
    when 4 then create_source
    else
      puts 'Invalid choice!'
    end
  end

  def call_activity_for(_choice)
    display_books
  end
end
