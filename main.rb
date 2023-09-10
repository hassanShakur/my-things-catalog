require_relative 'app'

def main
  app = App.new
  app.run

  loop do
    app.show_initial_options
    input = gets.chomp.to_i
    choice = app.validate_input(input, 6)
    break if choice == 6

    app.show_extra_options(choice)
  end

  app.store_items
  app.store_refs
  puts 'Thank you for using the App! Have a nice time!'
end

main
