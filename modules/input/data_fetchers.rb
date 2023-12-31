module DataFetchers
  def fetch_string(name)
    print "#{name.capitalize}: "
    gets.chomp
  end

  def fetch_int(prompt, max)
    print "#{prompt.capitalize}: "
    validate_input(gets.chomp.to_i, max)
  end

  def fetch_date(date_type = 'publish date')
    date = fetch_string("#{date_type} [yy/mm/dd]")
    vaidate_date(date)
  end

  def fetch_valid_bool(title)
    map_bool = { 'n' => false, 'y' => true }
    my_bool = nil
    print "#{title.capitalize} [y/n]: "

    loop do
      my_bool = map_bool[gets.chomp.downcase]
      break unless my_bool.nil?

      print 'Invalid input! [Y/N]: '
    end

    my_bool
  end
end
