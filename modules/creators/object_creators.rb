module ObjectCreators
  def create_author
    notify_start_creation('author')
    first_name = fetch_string('first name')
    last_name = fetch_string('last name')
    @authors << Author.new(first_name, last_name)
    notify_success_creation('author')
  end

  def create_genre
    notify_start_creation('genre')
    name = fetch_string('name')
    @genres << Genre.new(name)
    notify_success_creation('genre')
  end

  def create_label
    notify_start_creation('label')
    title = fetch_string('title')
    color = fetch_string('color')
    @labels << Label.new(title, color)
    notify_success_creation('label')
  end

  def create_source
    notify_start_creation('source')
    name = fetch_string('name')
    @sources << Source.new(name)
    notify_success_creation('source')
  end
end
