require_relative 'app'

def main
  app = App.new
  app.run

  loop do
    app.show_options
    input = gets.chomp.to_i
    choice = app.validate_input(input, 7)
    break if choice == 7

    app.call_activity_for(choice)
  end

  app.save_data
  puts 'Thank you for using the App! Have a nice time!'
end

main
