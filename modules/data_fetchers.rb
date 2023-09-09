module DataFetchers
  def fetch_string(name)
    print "#{name.capitalize}: "
    gets.chomp
  end

  def fetch_date(date_type = 'publish date')
    date = fetch_string("#{date_type}(yy/mm/dd)")
    date.split('/').join(', ')
  end

  def fetch_valid_bool
    map_bool = { 'n' => false, 'y' => true }
    my_bool = nil

    loop do
      my_bool = map_bool[gets.chomp.downcase]
      break unless my_bool.nil?

      print 'Invalid input! [Y/N]: '
    end

    my_bool
  end
end
