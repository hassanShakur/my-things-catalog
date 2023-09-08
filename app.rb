class App
  def run
    puts "Welcome to School library App!\n"
  end

  def show_options; end

  def validate_input(input, max_val)
    loop do
      input_is_valid = input.is_a?(Integer) && input.between?(1, max_val)
      break if input_is_valid

      print 'Please enter a valid input: '
      input = gets.chomp.to_i
    end

    input
  end

  def call_activity_for; end

  def save_data; end
end
