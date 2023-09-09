# Classes
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/genre'
require_relative 'classes/source'

# Item classes
require_relative 'classes/item/item'
require_relative 'classes/item/book'
require_relative 'classes/item/game'
require_relative 'classes/item/movie'
require_relative 'classes/item/music_album'

# Modules
require_relative 'modules/app_logic'
require_relative 'modules/data_fetchers'
require_relative 'modules/data_presenters'
require_relative 'modules/input_validators'
require_relative 'modules/item_creators'
require_relative 'modules/item_presenters'
require_relative 'modules/object_creators'
require_relative 'modules/ui_beautifiers'
require_relative 'modules/user_feedback'

class App
  include AppLogic
  include DataFetchers
  include DataPresenters
  include InputValidators
  include ItemCreators
  include ItemPresenters
  include ObjectCreators
  include UIBeautifiers
  include UserFeedback

  def initialize
    @books = []
    @games = []
    @movies = []
    @music_albums = []

    @authors = []
    @genres = []
    @labels = []
    @sources = []
  end

  def run
    puts "Welcome to School library App!\n"
  end

  def save_data; end
end
