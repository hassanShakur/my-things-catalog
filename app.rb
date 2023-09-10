require 'json'

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
require_relative 'modules/data_loaders/item_data_loaders'
require_relative 'modules/data_presenters'
require_relative 'modules/data_savers/item_data_savers'
require_relative 'modules/input_validators'
require_relative 'modules/item_creators'
require_relative 'modules/item_presenters'
require_relative 'modules/object_creators'
require_relative 'modules/options_display'
require_relative 'modules/options_router'
require_relative 'modules/ui_beautifiers'
require_relative 'modules/user_feedback'

class App
  include AppLogic
  include DataFetchers
  include ItemDataLoaders
  include DataPresenters
  include ItemDataSavers
  include InputValidators
  include ItemCreators
  include ItemPresenters
  include ObjectCreators
  include OptionsDisplay
  include OptionsRouter
  include UIBeautifiers
  include UserFeedback

  def initialize
    @books = []
    @games = []
    @movies = []
    @genres = []
    @labels = []
    @sources = []
    @authors = []
    @music_albums = []
  end

  def run
    puts "Welcome to School library App!\n"
    load_refs
    load_items
  end
end
