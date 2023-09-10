module DataPresenters
  def display_labels
    print_border
    return no_item_created('label') if @labels.empty?

    show_list_title('Label')

    @labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.title.capitalize}"
    end
    print_border
  end

  def display_genres
    print_border
    return no_item_created('genre') if @genres.empty?

    show_list_title('Genre')

    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name.capitalize}"
    end
    print_border
  end

  def display_authors
    print_border
    return no_item_created('author') if @authors.empty?

    show_list_title('Author')

    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
    print_border
  end

  def display_sources
    print_border
    return no_item_created('source') if @sources.empty?

    show_list_title('Source')

    @sources.each_with_index do |source, index|
      puts "#{index + 1}. #{source.name}"
    end
    print_border
  end
end
