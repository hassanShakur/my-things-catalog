module InputValidators
  def validate_input(input, max_val)
    loop do
      input_is_valid = input.is_a?(Integer) && input.between?(1, max_val)
      break if input_is_valid

      print 'Please enter a valid input: '
      input = gets.chomp.to_i
    end

    input
  end

  def vaidate_date(date)
    loop do
      date_is_valid = true
      date.split('/').each do |d|
        date_is_valid = false unless ('1'..'5000').cover?(d)
      end
      break if date_is_valid

      print 'Please enter a valid date [yy/mm/dd]: '
      date = gets.chomp
    end

    date
  end
end
